/* 

  Auth
  static handlers for authentication to Firebase

*/

import 'package:fasted/blocs/bloc_user.dart';
import 'package:fasted/blocs/events/events_user.dart';
import 'package:fasted/blocs/states/states_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  // User Bloc
  static BlocUser _blocUser = BlocUser(StateUserInitial());

  // ************************ Public Static Methods ************************ \\

  static BlocUser getBlocUser() { return _blocUser; }

  static void initAuthListener() {
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User user) {
      if (user != null) {
        _blocUser.add(EventUserAuthenticate(user: user));
      } else {
        _blocUser.add(EventUserSignOut());
      }
    });
  }

  //create a user account with provided email and password
  static Future registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
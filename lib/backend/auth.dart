/* 

  Auth
  static handlers for authentication to Firebase

*/

import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  // ************************ Public Static Methods ************************ \\

  static void initAuthListener() {
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
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
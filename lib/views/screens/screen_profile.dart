import 'package:fasted/auth/auth_controller.dart';
import 'package:fasted/views/screens/screen.dart';
import 'package:fasted/views/screens/screen_widget.dart';
import 'package:fasted/widgets/buttons/custom_button_raised.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ScreenProfile extends StatefulWidget implements ScreenWidget {

  final Screen screen;
  ScreenProfile({Key key, @required this.screen}) : super(key: key);

  @override
  _ScreenProfileState createState() => _ScreenProfileState();

  @override
  Screen getScreen() { return screen; }

  @override
  Widget getWidget() { return this; }

}

class _ScreenProfileState extends State<ScreenProfile> {

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        CustomButtonRaised(
          text: 'Email',
          textColor: Colors.black,
          color: Colors.white,
          splashColor: Colors.black26,
          iconPath: 'email.png',
          onPressed: () => {
            AuthController().registerWithEmail("test@gmail.com", "12daso3")
          }
        ),
      
        CustomButtonRaised(
            text: 'Google',
            textColor: Colors.grey,
            color: Colors.white,
            splashColor: Colors.red[200],
            iconPath: 'logo_google.png',
            onPressed: signInWithGoogle,
        ),

        CustomButtonRaised(
          text: 'Apple',
          textColor: Colors.black,
          color: Colors.white,
          splashColor: Colors.black26,
          iconPath: 'logo_apple.png',
          onPressed: () => {}
        ),
      ],
    );
  }
}
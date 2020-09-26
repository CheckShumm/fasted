import 'package:fasted/widgets/buttons/custom_button_raised.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Unauthorized extends StatefulWidget {

  final Function onEmailPressed;
  final bool visible;
  Unauthorized({ Key key, 
    @required this.onEmailPressed,
    @required this.visible
  }): super(key:key);

  @override
  _UnauthorizedState createState() => _UnauthorizedState();
}

class _UnauthorizedState extends State<Unauthorized> {
  
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
    return AnimatedOpacity(
      opacity: this.widget.visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomButtonRaised(
            width: 256,
            text: 'Email',
            textColor: Colors.black,
            color: Colors.white,
            splashColor: Colors.black26,
            iconPath: 'email.png',
            onPressed: this.widget.onEmailPressed
          ),
        
          CustomButtonRaised(
            width: 256,
            text: 'Google',
            textColor: Colors.grey,
            color: Colors.white,
            splashColor: Colors.red[200],
            iconPath: 'logo_google.png',
            onPressed: signInWithGoogle,
          ),

          CustomButtonRaised(
            width: 256,
            text: 'Apple',
            textColor: Colors.black,
            color: Colors.white,
            splashColor: Colors.black26,
            iconPath: 'logo_apple.png',
            onPressed: () => {}
          ),
        ],
      ),
    );
  }
}
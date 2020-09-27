
import 'package:fasted/backend/auth.dart';
import 'package:fasted/widgets/buttons/custom_button_raised.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthEmail extends StatefulWidget {

  final bool visible;
  final Function onBack;
  final Function(String, String) onSignUp;

  AuthEmail({ Key key,
    @required this.visible,
    @required this.onBack,
    @required this.onSignUp,
  }) : super(key: key);

  @override
  _AuthEmailState createState() => _AuthEmailState();
}

class _AuthEmailState extends State<AuthEmail> {
  
  // states
  String _email;
  String _password;

  @override
  void initState() {
    super.initState(); 
    _email = "";
    _password = "";
  }

  Widget textFieldContainer(Widget textField) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container( 
        width: MediaQuery.of(context).size.width * 0.8,
        child: textField 
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: this.widget.visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email Sign Up",
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 4.0,
                      wordSpacing: 6.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: this.widget.onBack,
                    child: Icon(
                      Icons.arrow_back
                    ),
                  ),
                ],
              ),
            ),
          ),
          textFieldContainer(
            TextField(
              onChanged: (String email) => { _email = email },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),  
          textFieldContainer(
            TextField(
              onChanged: (String password) => { _password = password },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          CustomButtonRaised(
            width: MediaQuery.of(context).size.width*0.70,
            text: "Sign Up",
            textColor: Colors.white,
            color: Colors.black,
            splashColor: Colors.black45,
            onPressed: () async {
              await Auth.registerWithEmail(_email, _password);
              this.widget.onSignUp(_email, _password);
            }
          )
        ],
      ),
    );
  }
}
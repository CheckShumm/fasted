
import 'package:fasted/backend/auth.dart';
import 'package:fasted/blocs/bloc_user.dart';
import 'package:fasted/blocs/states/states_user.dart';
import 'package:fasted/model/user.dart';
import 'package:fasted/views/screens/profile/auth_email.dart';
import 'package:fasted/views/screens/profile/unauthorized.dart';
import 'package:fasted/views/screens/screen.dart';
import 'package:fasted/views/screens/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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

  // states
  bool unathorized = true;
  bool signUpFormEmail = false;

  Widget buildAuthenticationWidget() {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: (!signUpFormEmail) ?
          Unauthorized(
            onEmailPressed: () => setState(() { signUpFormEmail = true; }),
              
            visible: !signUpFormEmail
          ) :
          AuthEmail(
            visible: signUpFormEmail,
            onBack: () => {setState(() { signUpFormEmail = false; }) },
            onSignUp: (String email, String password) async {
              setState(() { 
                signUpFormEmail = false; 
                //TODO authorized = true;
              });
            },
          )
      );
  }

  Widget buildProfileWidget(User user) {
    return Container(
      child: Text(
        user.getEmail()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocUser, StateUser>(
      cubit: Auth.getBlocUser(),
      builder: (BuildContext context, stateUser) {
        if (stateUser is StateUserAuthenticated) 
          return buildProfileWidget(stateUser.user);
        else
          return buildAuthenticationWidget();
      }
    );
  }
}
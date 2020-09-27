
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

// user event interface
abstract class EventUser {}

// handles sign in
class EventUserSignIn extends EventUser {
  final String email;
  final String password;
  EventUserSignIn({@required this.email, @required this.password}) : assert(email != null, password != null);
}

// Authenticate user
class EventUserAuthenticate extends EventUser {
  final User user;
  EventUserAuthenticate({@required this.user});
}

// Sign user out
class EventUserSignOut extends EventUser {
  EventUserSignOut();
}
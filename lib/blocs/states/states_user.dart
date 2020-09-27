
import 'package:fasted/model/user.dart';
import 'package:flutter/foundation.dart';

abstract class StateUser {}

class StateUserInitial extends StateUser {}

class StateUserAuthenticated extends StateUser {
  final User user;
  StateUserAuthenticated({@required this.user});
}
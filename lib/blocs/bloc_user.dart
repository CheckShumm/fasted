

import 'package:fasted/blocs/states/states_user.dart';
import 'package:fasted/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events/events_user.dart';

class BlocUser extends Bloc<EventUser, StateUser> {
  
  BlocUser(StateUser initialState) : super(initialState);

  @override
  Stream<StateUser> mapEventToState(EventUser event) async* {
    if (event is EventUserAuthenticate) {
      User user = new User(uID: event.user.uid, email: event.user.email);
      yield StateUserAuthenticated(user: user);
    } 
  }

}
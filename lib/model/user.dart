
import 'package:flutter/foundation.dart';

class User {

  // **************** Private Members **************** \\ 

  final String email;         // user's email
  final String uID;           // user's unique ID
  String displayName;         // what to call the user by


  // ****************** Constructor ****************** \\ 
  
  // default constructor
  User({@required this.email, @required this.uID, this.displayName});


  // **************** Public Methods **************** \\ 
  
  // return unique ID
  String getUID() { return uID; }

  // return email
  String getEmail() { return email; }

}

import 'package:flutter/foundation.dart';

class User {

  // **************** Private Members **************** \\ 

  final String email;
  final String uID;
  String displayName;


  // ****************** Constructor ****************** \\ 
  
  // default constructor
  User({@required this.email, @required this.uID, this.displayName});


  // **************** Public Methods **************** \\ 
  
  // return unique ID
  String getUID() { return uID; }

  // return email
  String getEmail() { return email; }

}
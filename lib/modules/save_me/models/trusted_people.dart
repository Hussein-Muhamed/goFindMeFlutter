import 'dart:convert';

import 'package:flutter/cupertino.dart';

class trustedPerson {
  final String fname;
  final String lname;
  final String email;
  final String phoneNumber;
  final String userid;

  trustedPerson({
    @required this.fname,
    @required this.lname,
    @required this.email,
    @required this.phoneNumber,
    @required this.userid,
  });

  Map<String, dynamic> toMap() {
    return {
      'fname': fname,
      'lname': lname,
      'email': email,
      'phoneNumber': phoneNumber,
      'userid': userid,
    };
  }

  factory trustedPerson.fromMap(Map<String, dynamic> map) {
    return trustedPerson(
      fname: map['fname'],
      lname: map['lname'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      userid: map['userid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory trustedPerson.fromJson(String source) =>
      trustedPerson.fromMap(json.decode(source));
}

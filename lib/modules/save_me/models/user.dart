import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_find_me/modules/save_me/models/trusted_people.dart';

class User extends Equatable {
  final String fname;
  final String lname;
  final String email;
  final String password;
  final DateTime birthdate;
  final bool emailVerified;
  final String phoneNumber;
  final String gender;
  final String avatar;
  final trustedPerson trusted;

  User({
    @required this.fname,
    @required this.lname,
    @required this.email,
    @required this.password,
    @required this.birthdate,
    @required this.emailVerified,
    @required this.phoneNumber,
    @required this.gender,
    @required this.avatar,
    @required this.trusted,
  });

  @override
  List<Object> get props => [
        fname,
        lname,
        email,
        password,
        birthdate,
        emailVerified,
        phoneNumber,
        gender,
        avatar,
        trusted,
      ];

  Map<String, dynamic> toMap() {
    return {
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': password,
      'birthdate': birthdate.millisecondsSinceEpoch,
      'emailVerified': emailVerified,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'avatar': avatar,
      'trusted': trusted.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fname: map['fname'],
      lname: map['lname'],
      email: map['email'],
      password: map['password'],
      birthdate: DateTime.fromMillisecondsSinceEpoch(map['birthdate']),
      emailVerified: map['emailVerified'],
      phoneNumber: map['phoneNumber'],
      gender: map['gender'],
      avatar: map['avatar'],
      trusted: trustedPerson.fromMap(map['trusted']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

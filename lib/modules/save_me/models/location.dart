import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Location {
  final String city;
  final String region;

  Location({
    @required this.city,
    @required this.region,
  });

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'region': region,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      city: map['city'],
      region: map['region'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));
}

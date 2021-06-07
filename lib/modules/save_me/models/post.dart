import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:go_find_me/modules/save_me/models/location.dart';

class Post {
  final String type;
  final String name;
  final int age;
  final String gender;
  final String typeOfPerson;
  final DateTime missingDate;
  final DateTime date;
  final String imageid;
  final String details;
  final Location missingFrom;
  Location foundIn;
  final String userid;

  bool get isFound {
    return type.startsWith('F');
  }

  Post({
    @required this.type,
    @required this.name,
    @required this.age,
    @required this.gender,
    @required this.typeOfPerson,
    @required this.date,
    @required this.missingDate,
    @required this.imageid,
    @required this.details,
    this.foundIn,
    @required this.missingFrom,
    @required this.userid,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'age': age,
      'gender': gender,
      'typeOfPerson': typeOfPerson,
      'date': date.millisecondsSinceEpoch,
      'missingDate': missingDate.millisecondsSinceEpoch,
      'imageid': imageid,
      'details': details,
      'missingFrom': missingFrom.toMap(),
      'foundIn': foundIn.toMap(),
      'userid': userid,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      type: map['type'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      typeOfPerson: map['typeOfPerson'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      missingDate: DateTime.fromMillisecondsSinceEpoch(map['missingDate']),
      imageid: map['imageid'],
      details: map['details'],
      missingFrom: Location.fromMap(map['missingFrom']),
      foundIn: Location.fromMap(map['foundIn']),
      userid: map['userid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.type == type &&
        other.name == name &&
        other.age == age &&
        other.gender == gender &&
        other.typeOfPerson == typeOfPerson &&
        other.date == date &&
        other.missingDate == missingDate &&
        other.imageid == imageid &&
        other.details == details &&
        other.missingFrom == missingFrom &&
        other.foundIn == foundIn &&
        other.userid == userid;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        name.hashCode ^
        age.hashCode ^
        gender.hashCode ^
        typeOfPerson.hashCode ^
        date.hashCode ^
        missingDate.hashCode ^
        imageid.hashCode ^
        details.hashCode ^
        missingFrom.hashCode ^
        foundIn.hashCode ^
        userid.hashCode;
  }
}

List<Post> myposts = [
  Post(
    type: "Missing",
    name: "Mostafa Mohamed",
    age: 10,
    gender: "Male",
    typeOfPerson: "Child",
    missingFrom: Location(
      city: "Cairo",
      region: "El Zamalek Street",
    ),
    date: DateTime.now(),
    missingDate: DateTime.now(),
    imageid:
        "https://www.bbcchildreninneed.co.uk/wp-content/uploads/2019/08/What-We-Do-article-image-e1566212514292-1920x1080.jpg",
    userid: "1slkdfj1klj32421",
    details:
        'Wallahy ya bash abny da m3toh, herb mny wana bgeb 5odar 34an atf7hm. Al mohm Mn w2taha mrg34.',
  ),
  Post(
    type: "Missing",
    name: "Fatma Elsayed",
    age: 13,
    gender: "Male",
    typeOfPerson: "Child",
    missingFrom: Location(
      city: "Cairo",
      region: "Shobra Masr",
    ),
    date: DateTime.now(),
    missingDate: DateTime.now(),
    imageid: "https://thumbs.dreamstime.com/b/portrait-asian-girl-8160269.jpg",
    userid: "1slkdfj1kljsfsdfsdf32421",
    details:
        'Wallahy ya bash abny da m3toh, herb mny wana bgeb 5odar 34an atf7hm. Al mohm Mn w2taha mrg34.',
  ),
  Post(
    type: "Found",
    name: "Ahmed Mohamed",
    age: 15,
    gender: "Male",
    typeOfPerson: "Child",
    missingFrom: Location(
      city: "Giza",
      region: "El Haram Street",
    ),
    foundIn: Location(
      city: "Giza",
      region: "Kirdas",
    ),
    date: DateTime.now(),
    missingDate: DateTime.now(),
    imageid:
        "https://aifs.gov.au/cfca/sites/default/files/styles/front_page_slider/public/gettyimages-fizkes.png?itok=X1laF9hz",
    userid: "sdlkf932421",
    details:
        'Wallahy ya bash abny da m3toh, herb mny wana bgeb 5odar 34an atf7hm. Al mohm Mn w2taha mrg34.',
  ),
];

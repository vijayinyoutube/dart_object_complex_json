import 'dart:convert';

import 'package:flutter/foundation.dart';

class HomePageModel {
  final String name;
  final Map<String, Object> address;
  final Map<String, Object> dob;

  HomePageModel(
    this.name,
    this.address,
    this.dob,
  );

  HomePageModel copyWith({
    String? name,
    Map<String, Object>? address,
    Map<String, Object>? dob,
  }) {
    return HomePageModel(
      name ?? this.name,
      address ?? this.address,
      dob ?? this.dob,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'dob': dob,
    };
  }

  factory HomePageModel.fromMap(Map<String, dynamic> map) {
    return HomePageModel(
        map['name'] as String,
        Map<String, Object>.from((map['address'] as Map<String, Object>)),
        Map<String, Object>.from((map['dob'] as Map<String, Object>)));
  }

  String toJson() => json.encode(toMap());

  factory HomePageModel.fromJson(String source) =>
      HomePageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HomePageModel(name: $name, address: $address, dob: $dob)';

  @override
  bool operator ==(covariant HomePageModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        mapEquals(other.address, address) &&
        mapEquals(other.dob, dob);
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode ^ dob.hashCode;
}

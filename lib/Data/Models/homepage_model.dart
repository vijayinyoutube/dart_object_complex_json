// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class HomePageModel {
  final String name;
  final Map<String, Object> address;
  final Map<String, Object> dob;
  final List<Map<String, Object>> reviews;

  HomePageModel(
    this.name,
    this.address,
    this.dob,
    this.reviews,
  );

  HomePageModel copyWith({
    String? name,
    Map<String, Object>? address,
    Map<String, Object>? dob,
    List<Map<String, Object>>? reviews,
  }) {
    return HomePageModel(
      name ?? this.name,
      address ?? this.address,
      dob ?? this.dob,
      reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'dob': dob,
      'reviews': reviews,
    };
  }

  factory HomePageModel.fromMap(Map<String, dynamic> map) {
    return HomePageModel(
      map['name'] as String,
      Map<String, Object>.from(
        (map['address'] as Map<String, Object>),
      ),
      Map<String, Object>.from(
        (map['dob'] as Map<String, Object>),
      ),
      List<Map<String, Object>>.from(
        (map['reviews'] as List<dynamic>).map<Map<String, Object>>(
          (x) => x,
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomePageModel.fromJson(String source) =>
      HomePageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomePageModel(name: $name, address: $address, dob: $dob, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant HomePageModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        mapEquals(other.address, address) &&
        mapEquals(other.dob, dob) &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return name.hashCode ^ address.hashCode ^ dob.hashCode ^ reviews.hashCode;
  }
}

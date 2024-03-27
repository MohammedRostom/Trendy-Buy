import 'package:flutter/foundation.dart';

class Categorymodel {
  final String id;
  final String category;
  Categorymodel({required this.id, required this.category});

  factory Categorymodel.fromJson(Map<String, dynamic> json) {
    return Categorymodel(
      id: json['_id'],
      category: json['category'],
    );
  }
}

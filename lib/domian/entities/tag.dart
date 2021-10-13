import 'package:flutter/material.dart';

class Tag {
  late final String _id;
  late String _name;
  late int _color;

  Tag({
    String? id,
    String? name,
    int? color,
  }) {
    _id = id ?? UniqueKey().toString();
    _name = name ?? "";
    _color = color ?? 0xFFFFFFFF;
  }

  String get id => _id;

  String get name => _name;

  set name(String newName) => _name = newName;

  int get color => _color;

  set color(int val) => _color = val;

  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "name": _name,
      "color": _color,
    };
  }

  static Tag fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map["id"],
      name: map["name"],
      color: map["color"].toInt,
    );
  }

  @override
  String toString() {
    return "id[$id] Name: $name";
  }
}

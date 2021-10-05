import 'package:flutter/material.dart';

class Tag {
  late final String _id;
  late String _name;
  late Color _color;

  Tag({
    String? id,
    String? name,
    Color? color,
  }) {
    _id = id ?? UniqueKey().toString();
    _name = name ?? "";
    _color = color ?? Colors.white;
  }

  String get id => _id;

  String get name => _name;

  set name(String newName) => _name = newName;

  Color get color => _color;

  set color(Color val) => _color = val;

  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "name": _name,
      "color": _color.value
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map["id"],
      name: map["name"],
      color: map["color"] != null ? Color(map["color"]) : Colors.white,
    );
  }
}

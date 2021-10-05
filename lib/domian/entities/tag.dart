import 'package:flutter/material.dart';

class Tag {
  late final String id;
  late String _name;
  late Color _color;

  Tag({
    String? id,
    String? name,
    Color? color,
  }) {
    id = id ?? UniqueKey().toString();
    _name = name ?? "";
    _color = color ?? Colors.white;
  }

  String get name => _name;

  set name(String newName) => _name = newName;

  Color get color => _color;

  set color(Color val) => _color = val;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "color": color.value
    };
  }

  Tag.fromMap(Map<String, dynamic> map) {
    Tag(
      id: map["id"],
      name: map["name"],
      color: map["color"] != null ? Color(map["color"]) : Colors.white,
    );
  }
}

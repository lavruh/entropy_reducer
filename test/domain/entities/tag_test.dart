import 'package:entropy_reducer/domian/entities/tag.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

main() {
  test('tag to map', () {
    Tag t = Tag(
      name: "newTag",
      color: Colors.black,
    );

    Map r = t.toMap();
    expect(r["name"], contains(t.name));
    expect(r["color"], t.color.value);
  });
}

// ignore_for_file: unused_field
import 'package:flutter/material.dart';

class Entry {
  late final String _id;
  Set<String> _tagsIds = {};
  String text;
  late DateTime _date;

  DateTime get date => _date;
  String get id => _id;

  Entry({
    String? id,
    Set<String>? tags,
    required this.text,
    DateTime? date,
  }) {
    _id = id ?? UniqueKey().toString();
    _tagsIds = tags ?? <String>{};
    _date = date ?? DateTime.now();
  }

  @override
  update({String? newText, DateTime? newDate}) {
    if (newText != null) text = newText;
    if (newDate != null) _date = newDate;
  }

  addTag({required String tagId}) {
    _tagsIds.add(tagId);
  }

  removeTag({required String tagId}) {
    _tagsIds.remove(tagId);
  }

  Set<String> get tagIds => _tagsIds;

  @override
  String toString() {
    return "id: $_id, date: $_date, name: $text";
  }
}

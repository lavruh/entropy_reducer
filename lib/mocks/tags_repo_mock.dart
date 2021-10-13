import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/domian/entities/tag.dart';
import 'package:flutter/material.dart';

class TagsRepoMock implements TagsRepository {
  Map<String, Tag> _tags = {};

  TagsRepoMock() {
    for (int i = 1; i < 6; i++) {
      Tag t = Tag(name: "Tag$i", color: (Colors.green.value + i * 20));
      _tags.putIfAbsent(t.id, () => t);
    }
  }

  @override
  Map<String, Tag> getAllTags() {
    return _tags;
  }

  @override
  saveTags(Map<String, Tag> tags) {
    _tags = tags;
  }
}

import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/domian/entities/tag.dart';

class TagsRepoMock implements TagsRepository {
  Map<String, Tag> _tags = {};

  TagsRepoMock() {
    for (int i = 1; i < 6; i++) {
      Tag t = Tag(name: "Tag$i");
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

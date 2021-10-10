import 'package:get/get.dart';
import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/domian/entities/tag.dart';

class TagsState extends GetxController {
  TagsRepository repo;
  final availableTags = <String, Tag>{}.obs();
  final filteredTags = <String, Tag>{}.obs();
  TagsState(this.repo);

  getAvailableTags() {
    availableTags.addAll(repo.getAllTags());
  }

  filterTags(List filter) {}

  saveTags() {
    repo.saveTags(availableTags);
  }

  addOrUpdateTag(Tag t) {
    Tag? existing = availableTags.putIfAbsent(t.id, () => t);
    if (null != existing) {
      availableTags[existing.id] = t;
    }
  }

  removeTag(Tag t) {}
}

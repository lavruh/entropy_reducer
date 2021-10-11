import 'package:get/get.dart';
import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/domian/entities/tag.dart';

class TagsState extends GetxController {
  TagsRepository repo;
  final availableTags = <String, Tag>{}.obs;
  final filteredTags = <String, Tag>{}.obs;
  final tagsLen = 0.obs;
  TagsState(this.repo);

  getAvailableTags() {
    availableTags.addAll(repo.getAllTags());
    tagsLen.value = availableTags.length;
  }

  increement() {
    tagsLen.value++;
    print(tagsLen.value);
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

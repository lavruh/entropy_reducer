import 'package:entropy_reducer/domian/entities/tag.dart';

abstract class TagsRepository {
  Map<String, Tag> getAllTags();
  saveTags(Map<String, Tag> tags);
}

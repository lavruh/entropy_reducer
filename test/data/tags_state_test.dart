import 'package:test/test.dart';
import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/mocks/tags_repo_mock.dart';
import 'package:entropy_reducer/domian/entities/tag.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';

main() {
  TagsRepository repo = TagsRepoMock();
  TagsState state = TagsState(repo);
  test("get available tags", () {
    Map<String, Tag> r = repo.getAllTags();
    expect(r.length, 5);
  });

  test("save tags to repo", () {
    Tag t = Tag(name: "someName", color: 2);
    state.availableTags.putIfAbsent(t.id, () => t);

    state.saveTags();
    state.getAvailableTags();
    Map<String, Tag> c = Map();
    c.putIfAbsent(t.id, () => t);
    expect(state.availableTags, contains(t));
  });

  test("add tag", () {
    Tag t = Tag(name: "someName", color: 2);

    state.addOrUpdateTag(t);

    expect(
        state.availableTags,
        contains({
          t.id,
          t
        }));
  });
}

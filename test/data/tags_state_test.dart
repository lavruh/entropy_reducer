import 'package:test/test.dart';
import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/mocks/tags_repo_mock.dart';
import 'package:entropy_reducer/domain/states/tags_state.dart';
import 'package:entropy_reducer/domian/entities/tag.dart';

main() {
  TagsRepository repo = TagsRepoMock();
  TagsState state = TagsState(repo);
  test("get available tags", () {
    Map<String, Tag> r = repo.getAllTags();
    expect(r.length, 6);
  });

  test("save tag", () {});
}

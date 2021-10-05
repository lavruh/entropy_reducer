import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:entropy_reducer/domian/entities/entry.dart';
import 'package:entropy_reducer/domian/entities/info_entry.dart';
import 'package:entropy_reducer/domian/states/overview_state.dart';
import 'package:test/test.dart';

import 'entries_repo_mock.dart';

main() {
  EntriesRepoMock repo = EntriesRepoMock();
  OverviewState state = OverviewState(repo: repo);

  setUp(() {
    repo = EntriesRepoMock();
    state = OverviewState(repo: repo);
  });

  test("repo get all entries", () {
    state.getEntries([]);
    List<Entry> r = state.entries;

    expect(r.length, 10);
  });

  test("repo add", () {
    Entry e = InfoEntry(text: "text");
    repo.addOrUpdateEntry(e);

    expect(repo.entries, contains(e));
  });

  test('clear repo', () {
    repo.clear();
    expect(repo.entries.length, 0);
  });

  test('get filtered entries', () {
    state.getEntries([
      ["text", "String", "text_5"]
    ]);
    List<Entry> r = state.entries;

    expect(r.length, 1);
  });

  test('repo update entry', () {
    Entry e = repo.entries[1];
    e.text = "NEW TEXT";

    repo.addOrUpdateEntry(e);

    expect(repo.entries, contains(e));
    expect(repo.entries[repo.entries.indexOf(e)].text, e.text);
  });
}

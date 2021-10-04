import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:entropy_reducer/domian/entities/entry.dart';
import 'package:entropy_reducer/domian/states/overview_state.dart';
import 'package:test/test.dart';

import 'entries_repo_mock.dart';

main() {
  EntriesRepository repo = EntriesRepoMock();
  OverviewState state = OverviewState(repo: repo);
  test("repo get all entries", () {
    state.getEntries([]);
    List<Entry> r = state.entries;

    expect(r.length, 10);
  });
}

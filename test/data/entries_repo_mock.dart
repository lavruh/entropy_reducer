import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:entropy_reducer/domian/entities/entry.dart';
import 'package:entropy_reducer/domian/entities/task_entry.dart';
import 'package:entropy_reducer/domian/entities/value_entry.dart';

class EntriesRepoMock implements EntriesRepository {
  List<Entry> _entries = [];

  EntriesRepoMock() {
    for (int i = 0; i < 10; i++) {
      Entry e = i % 2 == 0
          ? TaskEntry(text: "text_$i")
          : ValueEntry(text: "text_$i", value: i);
      _entries.add(e);
    }
  }

  @override
  addOrUpdateEntry(Entry e) {
    late Entry found;
    try {
      found = _entries.firstWhere((element) => element.id == e.id);
    } on Exception catch (err) {
      _entries.add(e);
    }
    _entries.remove(found);
    _entries.add(e);
  }

  @override
  removeEntry(Entry e) {
    _entries.remove(e);
  }

  @override
  List<Entry> getEntries(List<List> request) {
    // request [field, runType, value] or [field, sort, bool order]
    List<Entry> result = [];
    if (request.isEmpty) {
      result = _entries;
    } else {
      for (List req in request) {}
    }
    return result;
  }
}

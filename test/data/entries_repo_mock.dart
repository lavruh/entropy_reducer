import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:entropy_reducer/domian/entities/entry.dart';
import 'package:entropy_reducer/domian/entities/task_entry.dart';
import 'package:entropy_reducer/domian/entities/value_entry.dart';

class EntriesRepoMock implements EntriesRepository {
  List<Entry> _entries = [];

  List<Entry> get entries => _entries;

  clear() {
    _entries.clear();
  }

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

    found = _entries.firstWhere((element) {
      bool fl = element.id == e.id;
      if (fl) {
        _entries.remove(element);
      }
      return fl;
    }, orElse: () {
      return e;
    });
    _entries.add(found);
  }

  @override
  removeEntry(Entry e) {
    _entries.remove(e);
  }

  @override
  List<Entry> getEntries(List<List> request) {
    // request [field, runType, value] or [field, sort, bool order]
    List<Entry> result = _entries;
    if (request.isNotEmpty) {
      for (List req in request) {
        List<Entry> tmp = [];
        for (Entry e in result) {
          if (req[0] == "text") {
            if (e.text.contains(req[2])) {
              tmp.add(e);
            }
          }
        }
        result = tmp;
      }
    }
    return result;
  }
}

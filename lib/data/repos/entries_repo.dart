import 'package:entropy_reducer/domian/entities/entry.dart';

abstract class EntriesRepository {
  List<Entry> getEntries(List<List> request);
  addOrUpdateEntry(Entry e);
  removeEntry(Entry e);
}

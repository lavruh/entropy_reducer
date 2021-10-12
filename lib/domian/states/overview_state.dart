import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:get/get.dart';
import 'package:entropy_reducer/domian/entities/entry.dart';

class OverviewState extends GetxController {
  final entries = <Entry>[].obs;
  late EntriesRepository _repo;

  OverviewState({required EntriesRepository repo}) : _repo = repo;

  getEntries(List<List> request) {
    entries.value = _repo.getEntries(request).obs;
  }

  saveEntries() {
    for (Entry e in entries.value) {
      _repo.addOrUpdateEntry(e);
    }
  }
}

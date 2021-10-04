import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:get/get.dart';
import 'package:entropy_reducer/domian/entities/entry.dart';

class OverviewState {
  List<Entry> entries = <Entry>[].obs();
  late EntriesRepository _repo;

  OverviewState({required EntriesRepository repo}) : _repo = repo;

  getEntries(List<List> request) {
    entries = _repo.getEntries(request).obs();
  }
}

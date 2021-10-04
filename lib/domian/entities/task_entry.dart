import 'package:entropy_reducer/domian/entities/info_entry.dart';

class TaskEntry extends InfoEntry {
  late bool _done;
  late DateTime _created;
  List<TaskEntry> subTasks = [];

  TaskEntry({
    String? id,
    required String text,
    DateTime? date,
    String? description,
    bool? done,
    DateTime? created,
  }) : super(
          id: id,
          text: text,
          date: date,
          description: description,
        ) {
    _done = done ?? false;
    _created = (created ?? date) ?? DateTime.now();
  }

  bool get done => _done;
  set done(bool val) => _done = val;

  DateTime get created => _created;
}

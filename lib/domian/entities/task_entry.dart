import 'package:entropy_reducer/domian/entities/info_entry.dart';

class TaskEntry extends InfoEntry {
  late bool done;
  late DateTime _created;
  List<TaskEntry> subTasks = [];

  TaskEntry({
    String? id,
    required String text,
    DateTime? date,
    String? description,
    bool? d,
    DateTime? created,
  }) : super(
          id: id,
          text: text,
          date: date,
          description: description,
        ) {
    done = d ?? false;
    _created = (created ?? date) ?? DateTime.now();
  }

  setDone(bool val) => done = val;

  DateTime get created => _created;

  @override
  String toString() {
    return "${super.toString()} Done: $done, Created: $_created";
  }
}

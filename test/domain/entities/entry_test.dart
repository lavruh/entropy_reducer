import 'package:entropy_reducer/domian/entities/info_entry.dart';
import 'package:entropy_reducer/domian/entities/task_entry.dart';
import 'package:entropy_reducer/domian/entities/value_entry.dart';
import 'package:test/test.dart';
import 'package:entropy_reducer/domian/entities/entry.dart';

main() {
  String initText = 'someText';
  DateTime initDate = DateTime(2021);
  test("null data to update", () {
    Entry e = Entry(text: initText, date: initDate);

    e.update();

    expect(e.text, initText);
    expect(e.date, initDate);
  });

  test('info entry', () {
    String desc = "some description";
    InfoEntry e = InfoEntry(
      text: initText,
      date: initDate,
      description: desc,
    );

    String tagId = "tag1";
    e.addTag(tagId: tagId);
    expect(e.id, isNotNull);
    expect(e.text, initText);
    expect(e.date, initDate);
    expect(e.descr, desc);
    expect(e.tagIds, contains(tagId));
  });

  test('value entry', () {
    String setID = "SomeID";
    ValueEntry e = ValueEntry(
      id: setID,
      text: initText,
      value: 19,
    );

    expect(e.id, setID);
    expect(e.value, 19);
  });

  test('task entry', () {
    TaskEntry e = TaskEntry(
      text: initText,
      date: initDate,
    );

    expect(e.text, initText);
    expect(e.date, initDate);
    expect(e.created, initDate);
  });

  test('add sub tasks', () {
    TaskEntry mainTask = TaskEntry(
      text: "main",
      description: "main desc",
    );
    TaskEntry subTask = TaskEntry(text: "sub1");
    mainTask.subTasks.add(subTask);
    mainTask.subTasks[0].subTasks.add(TaskEntry(text: "text"));
    mainTask.subTasks.add(TaskEntry(text: "text"));

    expect(mainTask.subTasks, contains(subTask));
    expect(mainTask.subTasks[0].subTasks[0].text, "text");
  });
}

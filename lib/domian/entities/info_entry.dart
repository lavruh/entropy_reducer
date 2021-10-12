import 'package:entropy_reducer/domian/entities/entry.dart';

class InfoEntry extends Entry {
  String descr = "";
  List<String> attachments = [];

  InfoEntry({
    String? id,
    required String text,
    DateTime? date,
    String? description,
  }) : super(
          id: id,
          text: text,
          date: date,
        ) {
    descr = description ?? "";
  }

  @override
  String toString() {
    return "${super.toString()} Description: $descr";
  }
}

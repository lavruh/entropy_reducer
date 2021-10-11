import 'package:entropy_reducer/domian/entities/entry.dart';

class ValueEntry extends Entry {
  num value;
  String? unit;

  ValueEntry({
    String? id,
    required String text,
    DateTime? date,
    required this.value,
    this.unit,
  }) : super(
          id: id,
          text: text,
          date: date,
        );
}

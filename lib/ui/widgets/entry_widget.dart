import 'package:entropy_reducer/domian/entities/entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryWidget extends StatelessWidget {
  Entry e;

  EntryWidget(this.e, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(3.0),
      elevation: 3.0,
      child: Wrap(
        children: [
          Text(DateFormat("d-M-y").format(e.date)),
          Text(e.text),
        ],
      ),
    );
  }
}

import 'package:entropy_reducer/domian/entities/entry.dart';
import 'package:entropy_reducer/domian/entities/info_entry.dart';
import 'package:entropy_reducer/domian/entities/task_entry.dart';
import 'package:entropy_reducer/domian/entities/value_entry.dart';
import 'package:entropy_reducer/domian/states/overview_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EntryWidget extends StatelessWidget {
  Entry e;
  Function? updateCallback;

  EntryWidget(this.e, {Key? key, this.updateCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntryBodyWidget(
      children: [
        _cardRow([
          if (e.runtimeType == TaskEntry)
            GetBuilder<OverviewState>(
                builder: (_) => Checkbox(
                    value: (e as TaskEntry).done,
                    onChanged: (val) {
                      (e as TaskEntry).setDone(val ?? false);
                      _.update();
                    }))
          else
            Icon(Icons.info_outline_rounded),
          Text(
            e.text,
            style: Theme.of(context).textTheme.headline6,
          ),
        ]),
        _cardRow([
          e.runtimeType == InfoEntry || e.runtimeType == TaskEntry
              ? _descriptionField(context, e as InfoEntry)
              : Container(),
          e.runtimeType == ValueEntry
              ? _valueField(context, e as ValueEntry)
              : Container(),
        ]),
        _cardRow(
          [
            Text(
              "Created:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              DateFormat("d-M-y").format(e.date),
            ),
          ],
        )
      ],
    );
  }

  Widget _valueField(context, ValueEntry ve) {
    return Wrap(
      spacing: 8.0,
      children: [
        Text(
          "Value:",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(ve.value.toString()),
        if (ve.unit != null) Text(ve.unit.toString()),
      ],
    );
  }

  Widget _descriptionField(context, InfoEntry ie) {
    return Wrap(
      spacing: 8.0,
      runAlignment: WrapAlignment.center,
      children: [
        Text(
          "Description:",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(ie.descr),
      ],
    );
  }

  Widget _cardRow(List<Widget> children) {
    return Wrap(
      runAlignment: WrapAlignment.center,
      spacing: 5,
      children: children,
    );
  }
}

class EntryBodyWidget extends StatelessWidget {
  List<Widget> children;

  EntryBodyWidget({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(3.0),
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

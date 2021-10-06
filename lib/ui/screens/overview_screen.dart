import 'package:entropy_reducer/domian/states/overview_state.dart';
import 'package:entropy_reducer/ui/widgets/entry_widget.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  OverviewScreen(OverviewState state, {Key? key})
      : _state = state,
        super(key: key);
  OverviewState _state;

  @override
  Widget build(BuildContext context) {
    _state.getEntries([]);
    return Scaffold(
      body: Center(
        child: ListView(
          children: _state.entries.map((e) => EntryWidget(e)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

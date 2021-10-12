import 'package:entropy_reducer/domian/entities/entry.dart';
import 'package:entropy_reducer/domian/states/overview_state.dart';
import 'package:entropy_reducer/ui/widgets/entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class OverviewScreen extends StatelessWidget {
  OverviewScreen(OverviewState state, {Key? key})
      : _state = state,
        super(key: key);
  OverviewState _state;

  @override
  Widget build(BuildContext context) {
    _state.getEntries([]);
    return Scaffold(
      body: Center(child: Container(child: Obx(() {
        List<EntryWidget> content = [];
        for (int i = 0; i < _state.entries.value.length; i++) {
          content.add(EntryWidget(
            _state.entries.value[i],
            updateCallback: (Entry e) {},
          ));
        }

        return ListView(
          children: content,
        );
      }))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

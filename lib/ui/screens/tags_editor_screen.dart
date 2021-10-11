import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:entropy_reducer/ui/widgets/tags_widget.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';

class TagsEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("test"),
          TagsWidget(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';
import 'package:get/get.dart';

class TagsWidget extends StatelessWidget {
  final TagsState state;

  TagsWidget(this.state);

  @override
  Widget build(BuildContext context) {
    Widget? content = Obx(() => Wrap(
          children: this.state.availableTags.values.map((tag) {
            return Text(tag.id);
          }).toList(),
        ));
    return content ?? Container();
  }
}

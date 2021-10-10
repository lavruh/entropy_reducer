import 'package:flutter/material.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';
import 'package:get/get.dart';

class TagsWidget extends StatelessWidget {
  final TagsState state;

  TagsWidget(this.state);

  @override
  Widget build(BuildContext context) {
    Widget? content = GetBuilder<TagsState>(
        builder: (_) => Wrap(
              children: _.availableTags.values.map((tag) {
                return Text(tag.id);
              }).toList(),
            ));
    return content ?? Container();
  }
}

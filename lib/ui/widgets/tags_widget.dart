import 'package:flutter/material.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';
import 'package:get/get.dart';

class TagsWidget extends StatelessWidget {
  final TagsState state = Get.find();

  @override
  Widget build(BuildContext context) {
    state.getAvailableTags();
    return GetBuilder<TagsState>(
        builder: (_) => Transform(
            transform: Matrix4.identity()..scale(0.6),
            child: Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              textDirection: TextDirection.ltr,
              children: state.availableTags.values.map((tag) {
                return ActionChip(
                  label: Text(
                    tag.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  backgroundColor: Color(tag.color),
                  onPressed: () {},
                );
              }).toList(),
            )));
  }
}

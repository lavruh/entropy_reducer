import 'package:flutter/material.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';
import 'package:get/get.dart';

class TagsWidget extends StatelessWidget {
  final TagsState state = Get.put<TagsState>(
    TagsState(Get.find()),
  );

  TagsWidget();

  @override
  Widget build(BuildContext context) {
    state.getAvailableTags();
    return GetX<TagsState>(
            init: Get.find<TagsState>(),
            builder: (state) => Column(
                  children: [
                    Text("Content ${state.availableTags.length}"),
                    Wrap(
                      textDirection: TextDirection.ltr,
                      children: state.availableTags.values.map((tag) {
                        return Text(tag.id);
                      }).toList(),
                    ),
                    ElevatedButton(
                      child: Text("Increement"),
                      onPressed: () {
                        state.increement();
                      },
                    ),
                  ],
                )) ??
        Text("Content null");
  }
}

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
        builder: (_) => Column(
              children: [
                Text("Content ${_.availableTags.length}"),
                Wrap(
                  textDirection: TextDirection.ltr,
                  children: _.availableTags.values.map((tag) {
                    return Text(tag.id);
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    child: Text("Increement"),
                    onPressed: () {
                      _.increement();
                    },
                  ),
                ),
              ],
            ));
  }
}

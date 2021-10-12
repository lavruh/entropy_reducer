import 'package:flutter/material.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';
import 'package:get/get.dart';

class TagsWidget extends StatelessWidget {
  final TagsState state = Get.find();

  @override
  Widget build(BuildContext context) {
    state.getAvailableTags();
    return Obx(() => Column(
          children: [
            Text("Content ${state.availableTags.length}"),
            Wrap(
              textDirection: TextDirection.ltr,
              children: state.availableTags.values.map((tag) {
                return Text(tag.id);
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                child: Text("Increement"),
                onPressed: () {
                  state.increement();
                  state.update();
                },
              ),
            ),
          ],
        ));
  }
}

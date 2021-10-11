import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:entropy_reducer/ui/widgets/tags_widget.dart';

class TagsEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TagsWidget(Get.find()));
  }
}

import 'package:entropy_reducer/ui/screens/overview_screen.dart';
import 'package:entropy_reducer/ui/screens/tags_editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:entropy_reducer/di.dart';

void main() {
  di();
  runApp(const EntropyReducerApp());
}

class EntropyReducerApp extends StatelessWidget {
  const EntropyReducerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Get.find<TagsEditor>(),
    );
  }
}

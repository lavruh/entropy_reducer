import 'package:entropy_reducer/ui/screens/overview_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const OverviewScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:entropy_reducer/domian/states/overview_state.dart';
import 'package:entropy_reducer/mocks/entries_repo_mock.dart';
import 'package:entropy_reducer/ui/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Overview screen state', (WidgetTester tester) async {
    EntriesRepository repo = EntriesRepoMock();
    OverviewState state = Get.put<OverviewState>(OverviewState(repo: repo));

    OverviewScreen testWidget = OverviewScreen(state);

    await tester.pumpWidget(testableWidget(child: testWidget));
    // await tester.pump();

    expect(find.text('text_2'), findsOneWidget);
    expect(find.byType(Checkbox), findsWidgets);
  });
}

Widget testableWidget({required Widget child}) {
  return MediaQuery(
    data: MediaQueryData(),
    child: GetMaterialApp(
      home: Scaffold(body: child),
    ),
  );
}

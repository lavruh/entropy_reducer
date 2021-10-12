import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/mocks/tags_repo_mock.dart';
import 'package:entropy_reducer/domian/entities/tag.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';
import 'package:entropy_reducer/ui/widgets/tags_widget.dart';

import 'package:entropy_reducer/main.dart';
import 'package:entropy_reducer/di.dart';

void main() {
  di();

  testWidgets('tags widget create test', (WidgetTester tester) async {
    TagsRepository repo = TagsRepoMock();
    TagsState state = TagsState(repo);
    Tag t = repo.getAllTags().values.last;

    state.getAvailableTags();

    await tester.pumpWidget(testableWidget(child: TagsWidget()));

    expect(find.text(t.id), findsOneWidget);

    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
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

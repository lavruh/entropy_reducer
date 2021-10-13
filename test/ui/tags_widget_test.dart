import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/mocks/tags_repo_mock.dart';
import 'package:entropy_reducer/domian/entities/tag.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';
import 'package:entropy_reducer/ui/widgets/tags_widget.dart';
import 'package:get/get.dart';
import 'package:entropy_reducer/di.dart';

void main() {
  // di();

  testWidgets('tags widget create test', (WidgetTester tester) async {
    TagsRepository repo = Get.put<TagsRepository>(TagsRepoMock());
    TagsState state = Get.put<TagsState>(TagsState(Get.find()));
    TagsWidget w = TagsWidget();

    Tag t = repo.getAllTags().values.last;

    state.getAvailableTags();
    expect(state.availableTags, isNotEmpty);
    await tester.pumpWidget(testableWidget(child: w));
    await tester.pump();
    int l = state.tagsLen.value;
    expect(find.textContaining("Content"), findsOneWidget);
    expect(find.textContaining(t.id), findsOneWidget);
    expect(find.textContaining("tag"), findsNWidgets(l));

    await tester.tap(find.text("Increement"));
    await tester.pump();
    expect(find.textContaining("tag"), findsNWidgets(l + 1));

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

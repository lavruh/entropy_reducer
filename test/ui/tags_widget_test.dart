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
    expect(find.textContaining(t.name), findsOneWidget);
    expect(find.byType(ActionChip), findsNWidgets(l));
    Tag nt = Tag(name: "newTag", color: Colors.black.value);
    state.addOrUpdateTag(nt);

    await tester.pump();
    expect(find.textContaining(nt.name), findsOneWidget);
    // check color
    Finder f = find.ancestor(of: find.text(nt.name), matching: find.byType(ActionChip));
    expect(f, findsOneWidget);
    expect(tester.widget<ActionChip>(f).backgroundColor, Color(nt.color));
    // expect(tester.widget(find.textContaining(nt.name)), isA<Text>().having((t) => t.text, 'text', nt.name));
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

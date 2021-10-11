import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:entropy_reducer/data/repos/tags_repo.dart';
import 'package:entropy_reducer/domian/states/overview_state.dart';
import 'package:entropy_reducer/domian/states/tags_state.dart';
import 'package:entropy_reducer/ui/screens/overview_screen.dart';
import 'package:entropy_reducer/ui/screens/tags_editor_screen.dart';
import 'package:entropy_reducer/mocks/tags_repo_mock.dart';
import 'mocks/entries_repo_mock.dart';
import "package:get/get.dart";

void di() {
  Get.put<EntriesRepository>(EntriesRepoMock());
  Get.put<OverviewState>(OverviewState(repo: Get.find()), permanent: true);
  Get.put<OverviewScreen>(OverviewScreen(Get.find()));

  Get.put<TagsRepository>(TagsRepoMock());
  Get.put<TagsState>(TagsState(Get.find()), permanent: true);
  Get.put<TagsEditor>(TagsEditor());
}

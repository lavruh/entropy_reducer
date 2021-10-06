import 'package:entropy_reducer/data/repos/entries_repo.dart';
import 'package:entropy_reducer/domian/states/overview_state.dart';
import 'package:entropy_reducer/ui/screens/overview_screen.dart';
import "package:get/get.dart";

import 'mocks/entries_repo_mock.dart';

void di() {
  Get.put<EntriesRepository>(EntriesRepoMock());
  Get.put<OverviewState>(OverviewState(repo: Get.find()), permanent: true);
  Get.put<OverviewScreen>(OverviewScreen(Get.find()));
}

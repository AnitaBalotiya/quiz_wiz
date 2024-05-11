import 'package:get/get.dart';
import 'package:quiz_wiz/helper/global.dart';

import '../../helper/my_dialogs.dart';
import '../../services/firebase/data/create_user.dart';
import '../../services/firebase/data/get_data.dart';
import '../auth/auth_controller.dart';
import '../home/home_screen.dart';
import 'questions.dart';

class QuestionsController extends GetxController {
  final authC = Get.find<AuthController>();

  //
  final questions = <Questions>[].obs;
  final showQuest = Questions().obs;
  final currentQuestIdx = 0.obs;
  final selectedAns = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getQuestionSet();
  }

  Future<void> getQuestionSet() async {
    final mainList = await GetData.getData(collectName: 'questions');
    if (mainList != null) {
      questions.value =
          mainList.map((e) => Questions.fromJson(e.data())).toList();
      showQuest.value = questions.first;
    }
  }

  void onClickNext() {
    if (!selectedAns.value.isValid) {
      MyDialogs.info(
          msg: 'Please select your answer from the options provided.',
          position: SnackPosition.TOP);
      return;
    }
    if (currentQuestIdx.value < questions.length) {
      currentQuestIdx.value++;

      if (showQuest.value.answer == selectedAns.value) {
        authC.user.score.value += 10;
      }
      if (currentQuestIdx.value == questions.length) {
        updateScore();
        return;
      }
      showQuest.value = questions[currentQuestIdx.value];
      selectedAns.value = '';
    }
  }

  void updateScore() async {
    await CreateUser.toUpdateField(
        key: 'score', value: '${authC.user.score.value}');
    Get.offAll(() => const HomeScreen());
  }
}

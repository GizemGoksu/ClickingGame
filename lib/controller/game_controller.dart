import 'package:clicking_game/core/constants/app_const.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  RxString result = ''.obs;
  RxBool infoTextVisible = true.obs;
  RxBool isThereWinner = false.obs;
  RxInt blueFlex = 10.obs;
  RxInt redFlex = 10.obs;

  @override
  Future<void> onInit() async {
    Future.delayed(AppConst.duration, () async {
      infoTextVisible.value = false;
    });
    super.onInit();
  }

  void clickFunction(RxInt yourFlex, RxInt rivalFlex) {
    yourFlex++;
    rivalFlex--;
    if (blueFlex.value == 0) {
      isThereWinner.value = true;
      result.value = 'Red won!';
    }
    if (redFlex.value == 0) {
      isThereWinner.value = true;
      result.value = 'Blue won!';
    }
  }

  void restart() {
    blueFlex.value = 10;
    redFlex.value = 10;
    isThereWinner.value = false;
    result.value = '';
  }
}

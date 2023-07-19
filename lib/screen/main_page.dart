import 'package:clicking_game/core/util/game_util.dart';
import 'package:clicking_game/product/game_button.dart';
import 'package:clicking_game/product/info_text.dart';
import 'package:clicking_game/product/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/game_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final GameController gameController = Get.put(GameController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          game(),
          InfoText(isVisible: gameController.infoTextVisible),
          resultWidget()
        ],
      ),
    );
  }

  ResultWidget resultWidget() {
    return ResultWidget(
      isThereWinner: gameController.isThereWinner,
      result: gameController.result,
      restartFunction: () => gameController.restart(),
    );
  }

  Column game() {
    return Column(
      children: [
        gameButton(AppColors.red),
        gameButton(AppColors.blue),
      ],
    );
  }

  GameButton gameButton(Color color) {
    RxInt yourFlex = color == AppColors.red
        ? gameController.redFlex
        : gameController.blueFlex;
    RxInt rivalFlex = color == AppColors.red
        ? gameController.blueFlex
        : gameController.redFlex;
    return GameButton(
        flex: yourFlex,
        color: color,
        onTap: gameController.isThereWinner.value == false
            ? () => gameController.clickFunction(yourFlex, rivalFlex)
            : null);
  }
}

import 'package:clicking_game/core/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/util/game_util.dart';
import 'info_text.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget(
      {super.key,
      required this.isThereWinner,
      required this.result,
      required this.restartFunction});

  final RxBool isThereWinner;
  final RxString result;
  final Function() restartFunction;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        opacity: isThereWinner.value ? 1 : 0,
        duration: AppConst.duration,
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                myText(result.value),
                restartIconButton()
              ],
            ),
          ),
      ),
    );
  }

  IconButton restartIconButton() {
    return IconButton(
              onPressed: restartFunction,
              icon: Icon(
                Icons.restart_alt,
                color: AppColors.white,
                size: AppConst.textIconSize,
              ));
  }
}



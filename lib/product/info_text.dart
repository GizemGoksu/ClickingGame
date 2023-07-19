import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/app_const.dart';
import '../core/util/game_util.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key, required this.isVisible});

  final RxBool isVisible;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
          opacity: isVisible.value ? 1 : 0,
          duration: AppConst.duration,
          child: Center(
            child: myText(AppConst.infoText),
          ),
        ),
      );
  }
}

Text myText(String data) => Text(
    data,
    style: TextStyle(fontSize: AppConst.textIconSize, color: AppColors.white),
);

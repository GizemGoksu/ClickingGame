import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameButton extends StatelessWidget {
  const GameButton(
      {super.key,
      required this.flex,
      required this.color,
      required this.onTap});

  final RxInt flex;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: flex.value,
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: color,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}

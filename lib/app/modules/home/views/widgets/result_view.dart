import 'package:calci/app/data/colors.dart';
import 'package:calci/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultView extends GetView<HomeController> {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller.calculationTextController.value,
            cursorColor: primaryTextColor,
            autofocus: true,
            keyboardType: TextInputType.none,
            style: TextStyle(color: primaryTextColor, fontSize: 42),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          Obx(
            () => Text(
              controller.result.value,
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 62,
              ),
            ),
          )
        ],
      ),
    );
  }
}

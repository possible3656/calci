import 'package:calci/app/data/colors.dart';
import 'package:calci/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorView extends GetView<HomeController> {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.zero,
      childAspectRatio: 1 / .8,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      children: List.generate(20, (index) {
        return InkWell(
          onTap: () => controller.onCalculatorButtonPressed(index),
          child: CircleAvatar(
            backgroundColor: secondaryBackgroundColor,
            child: Text(
              controller.calculatorModelList[index].title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: controller.calculatorModelList[index].textColor,
                fontSize: 24,
              ),
            ),
          ),
        );
      }),
    );
  }
}

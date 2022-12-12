import 'package:calci/app/data/colors.dart';
import 'package:calci/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorActionBar extends GetView<HomeController> {
  const CalculatorActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => controller.showHistoryPressed(),
              icon: Obx(
                    () => Icon(
                  controller.showHistory.value
                      ? Icons.calculate_outlined
                      : Icons.history,
                  color: primaryTextColor,
                ),
              ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.straighten,
                  color: primaryTextColor,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_add_outlined,
                color: primaryTextColor,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () => controller.onBackPressed(),
          icon: Icon(
            Icons.backspace_outlined,
            color: primaryTextColor,
          ),
        ),
      ],
    );
  }
}

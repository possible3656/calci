import 'package:calci/app/data/colors.dart';
import 'package:calci/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
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
                  Obx(() => Text(
                        controller.result.value,

                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 62,
                        ),
                      ),)
                ],
              ),
            ),
            Row(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                color: secondaryBackgroundColor,
                height: 1,
                width: Get.size.width,
              ),
            ),
            GridView.count(
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
            ),
          ],
        ),
      ),
    );
  }
}

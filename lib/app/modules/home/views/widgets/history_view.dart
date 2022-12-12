import 'package:calci/app/data/colors.dart';
import 'package:calci/app/data/global_methods.dart';
import 'package:calci/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends GetView<HomeController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: Get.size.height * .5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Obx(
                            () => ListView.builder(
                              shrinkWrap: true,
                              itemCount: Constants.history.length,
                              reverse: true,
                              itemBuilder: (ctx, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    Constants.history[Constants.history.length -
                                            index -
                                            1]
                                        .toString(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: index.isEven ? 32 : 22,
                                      color: primaryTextColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: index.isEven ? 20 : 10,
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () => controller.onClearHistory(),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.shade800,
                          ),
                          child: Center(
                              child: Text(
                            'Clear history',
                            style: TextStyle(
                              color: primaryTextColor,
                            ),
                          )),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    myButton('÷'),
                    myButton('x'),
                    myButton('-'),
                    myButton('+'),
                    myButton('='),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget myButton(String text) {
    return CircleAvatar(
      minRadius: Get.size.width * .1,
      backgroundColor: secondaryBackgroundColor,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: primaryButtonColor,
          fontSize: 24,
        ),
      ),
    );
  }
}

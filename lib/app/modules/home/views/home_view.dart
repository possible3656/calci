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
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.history,
                        color: primaryTextColor,
                      ),
                    ),
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
                  onPressed: () {},
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
                return CircleAvatar(
                  backgroundColor: secondaryBackgroundColor,
                  child: Text(
                    '',
                    style: TextStyle(color: primaryTextColor, fontSize: 22),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

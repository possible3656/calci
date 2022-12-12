import 'package:calci/app/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DividerView extends StatelessWidget {
  const DividerView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: secondaryBackgroundColor,
        height: 1,
        width: Get.size.width,
      ),
    );
  }
}

import 'package:calci/app/data/colors.dart';
import 'package:calci/app/modules/home/controllers/home_controller.dart';
import 'package:calci/app/modules/home/views/widgets/calculator_action_bar.dart';
import 'package:calci/app/modules/home/views/widgets/calculator_view.dart';
import 'package:calci/app/modules/home/views/widgets/divider_view.dart';
import 'package:calci/app/modules/home/views/widgets/result_view.dart';
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
          children: const [
            ResultView(),
           CalculatorActionBar(),
           DividerView(),
          CalculatorView() ],
        ),
      ),
    );
  }
}

import 'package:calci/app/data/calculator_model.dart';
import 'package:calci/app/data/colors.dart';
import 'package:calci/app/data/global_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeController extends GetxController {
  List<CalculatorModel> calculatorModelList = [];
  Rx<TextEditingController> calculationTextController =
      TextEditingController().obs;
  RxString result = ''.obs;
  RxBool showHistory = false.obs;

  @override
  void onInit() {
    addValue();
    super.onInit();
  }

  void addValue() {
    //first row
    calculatorModelList
      ..add(CalculatorModel('C', Colors.redAccent))
      ..add(CalculatorModel('()', primaryButtonColor))
      ..add(CalculatorModel('%', primaryButtonColor))
      ..add(CalculatorModel('÷', primaryButtonColor))
      //second row
      ..add(CalculatorModel('7', primaryTextColor))
      ..add(CalculatorModel('8', primaryTextColor))
      ..add(CalculatorModel('9', primaryTextColor))
      ..add(CalculatorModel('x', primaryButtonColor))
      //third row
      ..add(CalculatorModel('4', primaryTextColor))
      ..add(CalculatorModel('5', primaryTextColor))
      ..add(CalculatorModel('6', primaryTextColor))
      ..add(CalculatorModel('-', primaryButtonColor))
      //fourth row
      ..add(CalculatorModel('1', primaryTextColor))
      ..add(CalculatorModel('2', primaryTextColor))
      ..add(CalculatorModel('3', primaryTextColor))
      ..add(CalculatorModel('+', primaryButtonColor))
      //fifth row
      ..add(CalculatorModel('+/-', primaryTextColor))
      ..add(CalculatorModel('0', primaryTextColor))
      ..add(CalculatorModel('.', primaryTextColor))
      ..add(CalculatorModel('=', primaryButtonColor));
  }

  void onCalculatorButtonPressed(int index) {
    final title = calculatorModelList[index].title;

    if (title == 'C') {
      clearCalculator();
      return;
    }
    if (title == '()') {
      addBracketToEquation();
      return;
    }

    if (title == '=') {
      evaluateEquation();
      return;
    }
    calculationTextController.value.text += title;
    pointCursorToLast();
  }

  void onBackPressed() {
    var currentText = calculationTextController.value.text;
    if (currentText.isNotEmpty) {
      currentText = currentText.substring(0, currentText.length - 1);
      calculationTextController.value.text = currentText;
      pointCursorToLast();
    }
  }

  void pointCursorToLast() {
    calculationTextController.value.selection = TextSelection.collapsed(
      offset: calculationTextController.value.text.length,
    );
  }

  void clearCalculator() {
    calculationTextController.value.clear();
    result.value = '';
  }

  void addBracketToEquation() {
    if (calculationTextController.value.text.contains('(')) {
      calculationTextController.value.text += ')';
      pointCursorToLast();
      return;
    }
    calculationTextController.value.text += '(';
    pointCursorToLast();
  }

  void evaluateEquation() {
    if (calculationTextController.value.text.isEmpty) {
      Constants.showToast('please enter your equation');
      return;
    }
    try {
      final p = Parser();
      final exp = p.parse(
        calculationTextController.value.text
            .replaceAll('x', '*')
            .replaceAll('÷', '/'),
      );
      final cm = ContextModel();
      final eval = exp.evaluate(EvaluationType.REAL, cm);
      result.value = eval.toString();
    } catch (e) {
      debugPrint('Please enter correct equation');
      Constants.showToast(
        'Something went wrong! Please enter correct equation.',
      );
    }
  }

  void showHistoryPressed() {
    showHistory.value = !showHistory.value;
  }
}

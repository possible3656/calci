import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Constants {
  static void showToast(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static String historyKey = 'history';

  static RxList history = [].obs;
}

import 'package:flutter_easyloading/flutter_easyloading.dart';

class ShowToastDialog {
  const ShowToastDialog._();

  static void showToast(
    String? message, {
    EasyLoadingToastPosition position = EasyLoadingToastPosition.top,
  }) {
    if ((message ?? '').isEmpty) return;
    EasyLoading.showToast(message!, toastPosition: position);
  }

  static void showLoader(String message) {
    EasyLoading.show(status: message);
  }

  static void closeLoader() {
    EasyLoading.dismiss();
  }
}

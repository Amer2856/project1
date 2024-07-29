import 'package:get/get.dart';

extension PersentSized on double {
  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
}

extension ResponsiveText on double {
  double get sp => Get.height / 100 * (this / 3);
}

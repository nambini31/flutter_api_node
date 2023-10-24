// ignore_for_file: file_names

import 'package:get/get.dart';

import '../../connect/Controlleur/IndexControlleur.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IndexControlleur());
  }
}

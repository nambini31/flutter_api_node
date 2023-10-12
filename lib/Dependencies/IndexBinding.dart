// ignore_for_file: file_names

import 'package:flutter_api_node/Controlleur/IndexControlleur.dart';
import 'package:get/get.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IndexControlleur());
  }
}

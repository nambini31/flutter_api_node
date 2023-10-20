// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IndexControlleur extends GetxController {
  var index = 0.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void userSession() async {
    final session = await SharedPreferences.getInstance();
    //await session.setString('myKey', _controller.text);
  }
}

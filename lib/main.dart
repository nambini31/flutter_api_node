// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_api_node/Vues/Dependencies/IndexBinding.dart';
import 'package:flutter_api_node/Vues/IndexVue.dart';
import 'package:flutter_api_node/connect/Firebase/firebase_init.dart';
import 'package:flutter_api_node/routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  await initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: IndexVue(),
      initialRoute: "/Index/materiel",
      builder: EasyLoading.init(),
      getPages: [
        GetPage(
            name: Routes.acceuil,
            page: () => const IndexVue(),
            bindings: [IndexBinding()]),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_api_node/Dependencies/IndexBinding.dart';
import 'package:flutter_api_node/Vues/IndexVue.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
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
            name: "/Index/materiel",
            page: () => const IndexVue(),
            bindings: [IndexBinding()]),
      ],
    );
  }
}

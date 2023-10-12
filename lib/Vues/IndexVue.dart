import 'package:flutter/material.dart';
import 'package:flutter_api_node/Controlleur/IndexControlleur.dart';
import 'package:flutter_api_node/Vues/Materiel.dart';
import 'package:get/get.dart';

class IndexVue extends GetView<IndexControlleur> {
  const IndexVue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Materiel(),
    );
  }
}

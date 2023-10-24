// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../connect/Controlleur/IndexControlleur.dart';
import 'package:flutter_api_node/Vues/accueil/Materiel.dart';
import 'package:flutter_api_node/Vues/pageAdmin/pageAdmin.dart';
import 'package:get/get.dart';

class IndexVue extends GetView<IndexControlleur> {
  const IndexVue({super.key});

  @override
  Widget build(BuildContext context) {
    return (controller.index.value == 4) ? PageAdmin() : Materiel();
  }
}

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class IndexControlleur extends GetxController {
  var search = false.obs;
  var index = 0.obs;
  TextEditingController searchControlleur = TextEditingController();
  var count = 0.obs;

  var prixBitcoinActuel = 0.0.obs; // Le prix actuel du Bitcoin depuis l'API
  var qte_btc = 0.000006.obs; // Votre quantité de Bitcoin
  var prixBitcoin010923 = 24787.0.obs; // Prix d'achat du Bitcoin le 01/09/23

  @override
  void onInit() {
    super.onInit();
    reloadClick();
  }

  void reloadClick() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;

    EasyLoading.show(status: 'Chargement...');

    try {
      http
          .get(Uri.parse(
              'https://api.bitvavo.com/v2/ticker/price?market=BTC-EUR'))
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response(
              'Error', 408); // Request Timeout response status code
        },
      ).then((value) async {
        final response = await http.get(Uri.parse(
            'https://api.bitvavo.com/v2/ticker/price?market=BTC-EUR'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          prixBitcoinActuel.value = double.parse(data['price']);
          gain.value = (qte_btc * prixBitcoinActuel.value) -
              (qte_btc * prixBitcoin010923.value);
          gainp.value = (gain.value) / (prixBitcoin010923.value * 100);

          print(gainp.value);
          Future.delayed(
            const Duration(seconds: 2),
            () => EasyLoading.dismiss(),
          );
        }
      });
    } catch (e) {
      Future.delayed(
        const Duration(seconds: 2),
        () => EasyLoading.showError('Verifier la connexion',
            duration: const Duration(seconds: 4), dismissOnTap: true),
      );
    }
  }

  var gain = 0.0.obs;
  var gainp = 0.0.obs;
}

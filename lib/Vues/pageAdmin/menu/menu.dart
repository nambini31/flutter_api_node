// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_api_node/connect/services/user_services.dart';
import 'package:get/get.dart';

import '../../../connect/Controlleur/IndexControlleur.dart';

class Menu extends StatefulWidget {
  Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var control = Get.find<IndexControlleur>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      color: Color.fromRGBO(6, 11, 39, 0.767),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // control.index.value = 0;
                  //Get.forceAppUpdate();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // Bordure du bouton
                    )),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(10, 23, 95, 0.897),

                      //Color.fromARGB(255, 243, 63, 146),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.dashboard),
                    SizedBox(
                      width: 10,
                    ),
                    Text("DASHBOARD",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // control.index.value = 0;
                  //Get.forceAppUpdate();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // Bordure du bouton
                    )),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(10, 23, 95, 0.897),
                      //Color.fromARGB(255, 243, 63, 146),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wallet_sharp),
                    SizedBox(
                      width: 10,
                    ),
                    Text("WALLET",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255))),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // control.index.value = 0;
                  //Get.forceAppUpdate();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // Bordure du bouton
                    )),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(10, 23, 95, 0.897),

                      //Color.fromARGB(255, 243, 63, 146),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 10,
                    ),
                    Text("ACHAT",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255))),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // control.index.value = 0;
                  //Get.forceAppUpdate();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // Bordure du bouton
                    )),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(10, 23, 95, 0.897),

                      //Color.fromARGB(255, 243, 63, 146),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text("PROFIL",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255))),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // control.index.value = 0;
                  //Get.forceAppUpdate();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // Bordure du bouton
                    )),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(10, 23, 95, 0.897),

                      //Color.fromARGB(255, 243, 63, 146),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_balance_wallet_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text("COMPTE",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255))),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // control.index.value = 0;
                  //Get.forceAppUpdate();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // Bordure du bouton
                    )),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(10, 23, 95, 0.897),

                      //Color.fromARGB(255, 243, 63, 146),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 10,
                    ),
                    Text("PARAMETRES",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              //,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    control.index.value = 0;
                    Get.forceAppUpdate();
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0), // Bordure du bouton
                      )),
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(10, 23, 95, 0.897),

                        //Color.fromARGB(255, 243, 63, 146),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          logout().then((value) {
                            control.index.value = 1;
                            Get.forceAppUpdate();
                          });
                        },
                        child: Text("DECONNEXION",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

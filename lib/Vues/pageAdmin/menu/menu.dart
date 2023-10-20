// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        color: Color.fromRGBO(6, 11, 39, 0.767),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unrelated_type_equality_checks, unused_local_variable, duplicate_import, use_key_in_widget_constructors, file_names, camel_case_types, prefer_const_literals_to_create_immutables, empty_catches, duplicate_ignore, avoid_single_cascade_in_expression_statements, prefer_interpolation_to_compose_strings, must_be_immutable

//import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter_api_node/Controlleur/IndexControlleur.dart';

import 'package:flutter_api_node/Vues/Base.dart';
import 'package:flutter_api_node/Vues/two_letter_icon.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Materiel extends StatefulWidget {
  @override
  State<Materiel> createState() => _MaterielState();
}

class _MaterielState extends State<Materiel> {
  final FocusNode setfocus = FocusNode();

  var controller = Get.find<IndexControlleur>();

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Obx(
        () => Scaffold(
            key: scaffoldkey,
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                backgroundColor: Base.primary,
                leading: (controller.search.value == false)
                    ? IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          //scaffoldkey.currentState!.openDrawer(); mbo tsy
                        },
                        icon: Icon(Icons.menu, size: 30))
                    : null,
                automaticallyImplyLeading: false,
                centerTitle: true,
                titleSpacing: 10,
                toolbarTextStyle: TextStyle(backgroundColor: Colors.red),
                title: (controller.search.value == true)
                    ? TextFormField(
                        controller: controller.searchControlleur,
                        onChanged: (value) {
                          // controller.searchBar(value);
                        },
                        focusNode: setfocus,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            prefixIcon: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  setfocus.requestFocus();
                                  if (controller.search.value == true) {
                                    controller.search.value = false;
                                    if (controller.searchControlleur.text !=
                                        "") {
                                      controller.searchControlleur.text = "";
                                      //controller.search(""); mbo tsy
                                    }
                                  }
                                },
                                icon: Icon(Icons.arrow_back)),
                            prefixIconColor: Base.primary,
                            suffixIcon: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  if (controller.searchControlleur.text != "") {
                                    controller.searchControlleur.text = "";
                                    // controller.search(""); mbo tsy
                                  }
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: Base.primary,
                                )),
                            hintText: "Rechercher",
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none),
                      )
                    : Text(
                        "MONEY EXCHANGE",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                actions: (controller.search.value == false)
                    ? [
                        IconButton(
                            //highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setfocus.requestFocus();
                              controller.search.value = true;
                              //prepa_control.search(""); mbo tsy
                            },
                            icon: Icon(
                              Icons.search,
                            )),

                        //AnimSearchBar(width: MediaQuery.of(context).size.width / 1.3, textController: prepa_control.searchControlleur, onSuffixTap: () {}),
                        IconButton(
                            //highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              controller.reloadClick();
                              setfocus.requestFocus();
                            },
                            icon: Icon(
                              Icons.replay_outlined,
                            )),
                        SizedBox(
                          width: 0,
                        ),
                      ]
                    : null,
                // bottom: TabOnTap(),
              ),
            ),
            body: Container(
                padding: EdgeInsets.only(top: 10), child: preparationMauvais()
                //child: TabBarAffichage(),
                )),
      ),
    );
  }

  PopupMenuItem<int> popuMenuItem(String txt, IconData icons, int val) {
    return PopupMenuItem(
        value: val,
        child: Row(
          children: [
            Icon(
              icons,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Text(txt)
          ],
        ));
  }

  SlidableAutoCloseBehavior preparationMauvais() {
    var g = controller.gain.value.toString().length > 8
        ? controller.gain.value.toString().substring(0, 8)
        : controller.gain.value.toString();
    var gp = controller.gainp.value.toString().length > 8
        ? controller.gainp.value.toString().substring(0, 8)
        : controller.gain.value.toString();
    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      closeWhenTapped: true,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            //MaterielModel materiel = controller.listesMauvais[index];

            return Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textprep(
                        "GAIN : " + g,
                        (controller.gain.value >= 0)
                            ? Colors.red
                            : Colors.greenAccent),
                    SizedBox(
                      height: 12,
                    ),
                    textprep(
                        "%        : " + gp,
                        (controller.gain.value >= 0)
                            ? Colors.black
                            : Colors.black),
                  ],
                ),
                leading: TwoLetterIcon("\$"),
              ),
            );
          }),
    );
  }

  // Center ens_prep(Preparation prep) => Center(
  Widget textprep(String txt, Color col) => Text(
        txt,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: col),
      );
}

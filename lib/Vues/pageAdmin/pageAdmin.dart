// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_api_node/Controlleur/IndexControlleur.dart';
import 'package:flutter_api_node/Controlleur/pageAdminControlleur.dart';
import 'package:flutter_api_node/Vues/accueil/Materiel.dart';
import 'package:flutter_api_node/Vues/pageAdmin/dashboard/Dashboard.dart';
import 'package:flutter_api_node/Vues/pageAdmin/menu/menu.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PageAdmin extends GetView<PageAdminControlleur> {
  PageAdmin({super.key});
  final GlobalKey parentKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            title: Text(
              'DASHBOARD',
              style: GoogleFonts.getFont('Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            key: parentKey,
            leadingWidth: MediaQuery.sizeOf(context).height * 0.24,
            backgroundColor: Color.fromRGBO(8, 15, 54, 1),
            leading: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(10, 100),
                      elevation: 0, // Désactive l'élévation
                      backgroundColor: Colors.transparent,
                      // Couleur d'arrière-plan du bouton
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0), // Bordure du bouton
                      ),
                    ),
                    onPressed: () {},
                    child: Icon(Icons.arrow_back_ios_new_rounded)),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    child: Image.asset(
                      'lib/assets/images/389619943_1953096931750116_809664346407533714_n1.png',
                      fit: BoxFit.scaleDown,
                      height: 33,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 35, minHeight: 35),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    child: Icon(Icons.notifications_active),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 35, minHeight: 35),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    child: Icon(Icons.message_outlined),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.045,
                  height: MediaQuery.sizeOf(context).width * 0.045,
                  constraints: BoxConstraints(maxHeight: 35, minHeight: 35),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset(
                        'lib/assets/images/nico.jpg',
                      ).image,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          )),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 1,
            fit: BoxFit.fill,
            image: Image.asset(
              'lib/assets/images/fond.png',
            ).image,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Menu(), Dashboard()],
        ),
      ),
    );
  }
}

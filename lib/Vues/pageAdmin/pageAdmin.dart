// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_api_node/Vues/pageAdmin/dashboard/Dashboard.dart';
import 'package:flutter_api_node/Vues/pageAdmin/menu/menu.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../connect/Controlleur/IndexControlleur.dart';

class PageAdmin extends StatefulWidget {
  PageAdmin({super.key});

  @override
  State<PageAdmin> createState() => _PageAdminState();
}

class _PageAdminState extends State<PageAdmin> {
  //final GlobalKey parentKey = GlobalKey();
  var control = Get.find<IndexControlleur>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
    if (control.verifDrawer.value == 0) {
      control.verifDrawer.value == 1;
    } else {
      control.verifDrawer.value == 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: Menu(),
      key: _scaffoldKey,
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
            leadingWidth: 150,
            backgroundColor: Color.fromRGBO(8, 15, 54, 1),
            leading: Row(
              children: [
                (width > 1000)
                    ? SizedBox(
                        width: 6,
                      )
                    : ElevatedButton(
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
                        onPressed: () {
                          _openDrawer();
                          //print("object");
                        },
                        child: Icon(Icons.arrow_back_ios_new_rounded)),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    child: Image.asset(
                      'lib/assets/images/389619943_1953096931750116_809664346407533714_n1.png',
                      fit: BoxFit.scaleDown,
                      height: 35,
                      width: 65,
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height +
              6 -
              AppBar().preferredSize.height,
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
            children: [(width < 1000) ? SizedBox() : Menu(), Dashboard()],
          ),
        ),
      ),
    );
  }
}

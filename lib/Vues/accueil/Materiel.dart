// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import '../../connect/Controlleur/IndexControlleur.dart';
import 'package:flutter_api_node/Vues/login/Login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../register/Inscription.dart';
import 'Titre.dart';

class Materiel extends StatefulWidget {
  Materiel({Key? key}) : super(key: key);

  @override
  State<Materiel> createState() => _MaterielState();
}

class _MaterielState extends State<Materiel> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var control = Get.find<IndexControlleur>();

  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 136,
          backgroundColor: const Color(0xFF07031B),
          automaticallyImplyLeading: false,
          leading: Image.asset(
            'lib/assets/images/389619943_1953096931750116_809664346407533714_n1.png',
            fit: BoxFit.fitWidth,
          ),
          actions: [
            Image.asset(
              'lib/assets/images/téléchargement1.png',
              width: 100,
              fit: BoxFit.contain,
            ),
          ],
          centerTitle: false,
          elevation: 2,
        ),
        body: Container(
          height:
              MediaQuery.sizeOf(context).height - AppBar().preferredSize.height,
          child: SafeArea(
            top: true,
            child: Opacity(
              opacity: 0.9,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset(
                      'lib/assets/images/Best-blockchain-ETFs1.png',
                    ).image,
                  ),
                ),
                child: SingleChildScrollView(
                  child: LayoutBuilder(builder: (context, constraints) {
                    double width = MediaQuery.sizeOf(context).width;
                    double height = MediaQuery.sizeOf(context).height;
                    if (constraints.maxWidth < 600) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Titre(height: height, width: width),
                          (control.index.value == 0)
                              ? animation(context)
                              : (control.index.value == 1
                                  ? Login(height: height, width: width)
                                  : Inscription(height: height, width: width)),
                        ],
                      );
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Titre(height: height, width: width),
                          (control.index.value == 0)
                              ? animation(context)
                              : (control.index.value == 1
                                  ? Login(height: height, width: width)
                                  : Inscription(height: height, width: width)),
                        ],
                      );
                    }
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container animation(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.84,
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 3,
            top: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'lib/assets/images/380594703_686707480233160_4886927929347706727_n1.png',
                height: MediaQuery.of(context).size.width / 10,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 5,
            top: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'lib/assets/images/380438123_287128587577059_5360580875471552781_n.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.width / 17,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 9,
            top: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'lib/assets/images/380434028_290049557229574_8172786610973553296_n.png',
                height: MediaQuery.of(context).size.width / 10,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 12,
            top: 200,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0),
              child: InkWell(
                onTap: () {
                  control.index.value = 1;
                  Get.forceAppUpdate();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 10,
                  height: 185.07,
                  decoration: const ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0x6F071484),
                        Color(0xFF071484),
                        Color(0xFF0019FF)
                      ],
                    ),
                    shape: StarBorder.polygon(sides: 4),
                  ),
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Text(
                    'SE CONNECTER',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.008,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 4.5,
            top: (MediaQuery.of(context).size.width / 2) * 0.1,
            child: Opacity(
              opacity: 0.8,
              child: InkWell(
                onTap: () {
                  control.index.value = 2;
                  Get.forceAppUpdate();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 9,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2DFF42), Color(0xFF081485)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0.34, -1),
                      end: AlignmentDirectional(-0.34, 1),
                    ),
                    shape: BoxShape.circle,
                  ),
                  alignment: const AlignmentDirectional(0, 1.3),
                  child: Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      'S\'INSCRIRE',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.009,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

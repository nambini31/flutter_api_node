// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter_api_node/Vues/accueil/Titre.dart';
import 'package:flutter_api_node/Vues/underConstruction/under_%20construction.dart';
import 'package:flutter_api_node/connect/models/api_response.dart';
import 'package:flutter_api_node/connect/services/connect_bridge_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../connect/Controlleur/IndexControlleur.dart';
import 'package:flutter_api_node/Vues/login/Login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../register/Inscription.dart';

class Choix extends StatefulWidget {
  Choix({Key? key}) : super(key: key);

  @override
  State<Choix> createState() => _ChoixState();
}

class _ChoixState extends State<Choix> {


  var control = Get.find<IndexControlleur>();

  void _connectToBridgeToRedirect() async{
        ApiResponse apiResponse = await connectToBridge();
        if(apiResponse.error == null){
            Map<String, dynamic>? dataMap = apiResponse.data as Map<String, dynamic>?;
            String redirectUrl = dataMap!['redirect_url'];
            final Uri uri = Uri.parse(redirectUrl);
            _launchURL(uri);
        }
    }

    Future<void> _launchURL(Uri url) async {
        if(!await launchUrl(url)){
            throw 'Could not launch $url';
        }
    }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 100,
          backgroundColor: Color.fromARGB(255, 2, 1, 7),
          automaticallyImplyLeading: false,
          leading: Image.asset(
            'assets/images/389619943_1953096931750116_809664346407533714_n1.png',
            fit: BoxFit.fitWidth,
          ),
          actions: [
            Image.asset(
              'assets/images/téléchargement1.png',
              width: 45,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 6,
            )
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: Container(
          height:
              MediaQuery.sizeOf(context).height - AppBar().preferredSize.height,
          child: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(
                    filterQuality: FilterQuality.medium,
                    'assets/images/koloina.png',
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Image.asset('assets/images/euro.png'),
                                        Text(
                                            'Voulez vous épargner en €',
                                                style: GoogleFonts.getFont(
                                                'Roboto',
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ],
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Image.asset('assets/images/bitcoin.png'),
                                        Text(
                                            'Voulez vous épargner en bitcoin',
                                                style: GoogleFonts.getFont(
                                                'Roboto',
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ],
                                )
                            ],
                        )
                        
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Image.asset('assets/images/euro.png'),
                                Text(
                                    'Voulez vous épargner en €',
                                        style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                SizedBox(
                                    height: 40,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => UnderContruction()));
                                        /* control.index.value = 1;
                                        Get.forceAppUpdate(); */
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFC79000),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                        ),
                                    ),
                                    child: Text(
                                        'Cliquer ici',
                                            style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                ),
                            ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Image.asset('assets/images/bitcoin.png'),
                                Text(
                                    'Voulez vous épargner en bitcoin',
                                        style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                SizedBox(
                                    height: 40,
                                ),

                                ElevatedButton(
                                    onPressed: () {
                                        /* control.index.value = 1;
                                        Get.forceAppUpdate(); */
                                        _connectToBridgeToRedirect();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFF7A0B),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                        ),
                                    ),
                                    child: Text(
                                        'Cliquer ici',
                                            style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                ),
                            ],
                        )
                      ],
                    );
                  }
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container animation(BuildContext context) {
   // _controller.play();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.84,
      child: Stack(
        children: [
          /* Positioned(
              left: MediaQuery.of(context).size.width / 11,
              right: MediaQuery.of(context).size.width / 11,
              top: MediaQuery.of(context).size.width / 28,
              child: _controller.value.isInitialized
                  ? Container(
                      height: 450,
                      width: 450,
                      child: VideoPlayer(_controller),
                    )
                  : Container()), */
                  Positioned(
              left: MediaQuery.of(context).size.width / 11,
              right: MediaQuery.of(context).size.width / 11,
              top: MediaQuery.of(context).size.width / 28,
              child:  Container()),
          Positioned(
            left: MediaQuery.of(context).size.width / 2.9,
            right: MediaQuery.of(context).size.width / 9,
            top: 230,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/images/380594703_686707480233160_4886927929347706727_n1.png',
                height: MediaQuery.of(context).size.width / 11.5,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 5,
            right: MediaQuery.of(context).size.width / 4,
            top: 420,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/images/380438123_287128587577059_5360580875471552781_n.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.width / 20,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 9,
            right: MediaQuery.of(context).size.width / 2.9,
            top: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/images/380434028_290049557229574_8172786610973553296_n.png',
                height: MediaQuery.of(context).size.width / 12,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 15,
            right: MediaQuery.of(context).size.width / 3,
            top: 250,
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
                  height: 140,
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

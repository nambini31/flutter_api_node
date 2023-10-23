// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/services.dart';
import 'package:flutter_api_node/Controlleur/IndexControlleur.dart';
import 'package:flutter_api_node/connect/models/api_response.dart';
import 'package:flutter_api_node/connect/models/user.dart';
import 'package:flutter_api_node/connect/services/user_services.dart';
import 'package:flutter_api_node/connect/utils/utils.dart';
import 'package:flutter_api_node/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Materiel extends StatefulWidget {
  Materiel({Key? key}) : super(key: key);

  @override
  State<Materiel> createState() => _MaterielState();
}

class _MaterielState extends State<Materiel> {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    bool loading = false;
    TextEditingController? emailController;
    TextEditingController? passwordController;
    TextEditingController? passwordConfirmController;

    var control = Get.find<IndexControlleur>();

    void _loginUser() async {
            ApiResponse response = await login(emailController!.text, passwordController!.text);
        if (response.error == null){
            _saveAndRedirectToHome(response.data as User);
        }
        else {
            setState(() {
                loading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${response.error}')
            ));
        }
    }

    void _saveAndRedirectToHome(User user) async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('token', user.accessToken ?? '');
        await pref.setString('userId', user.uuid ?? '');
        await pref.setString('prefill_email', user.email ?? '');
       // Navigator.of(context).pushNamedAndRemoveUntil(Routes.pageAdmin, (route) => false);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Login success')
        ));
        setState(() {
            loading = false;
        });
        control.index.value = 4;
        Get.forceAppUpdate();
    }

    void _registerUser() async {
        ApiResponse response = await register(emailController!.text, passwordController!.text);
        if (response.error == null){
            _saveAndRedirectToLogin();
        }
        else {
            setState(() {
                loading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${response.error}')
            ));
        }
    }

    void _saveAndRedirectToLogin() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Register success')
        ));
        setState(() {
            loading = false;
        });
        control.index.value = 1;
        Get.forceAppUpdate();
    }

    @override
    void initState() {
        emailController = TextEditingController();
        passwordController = TextEditingController();
        passwordConfirmController = TextEditingController();
        super.initState();
    }

    @override
    void dispose() {
        emailController!.dispose();
        passwordController!.dispose();
        passwordConfirmController!.dispose();
        super.dispose();
    }

  TextEditingController dateController = TextEditingController();

  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        key: formKey,
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
                    if (constraints.maxWidth < 600) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Titre(context),
                          (control.index.value == 0)
                              ? animation(context)
                              : (control.index.value == 1
                                  ? Login(context)
                                  : inscription(context)),
                        ],
                      );
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Titre(context),
                          (control.index.value == 0)
                              ? animation(context)
                              : (control.index.value == 1
                                  ? Login(context)
                                  : inscription(context)),
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

  Container Titre(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 150, // Set the minimum width here
      ),
      height: MediaQuery.of(context).size.width * 0.50,
      width: MediaQuery.of(context).size.width / 2.2,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'WIN EDGE',
              style: GoogleFonts.getFont(
                'Roboto',
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.03),
            Text(
              'EPARGNE  INDOLORE',
              style: GoogleFonts.getFont(
                'Roboto',
                color: const Color(0xFF2DFF42),
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.03),
            Text(
              'Transformez vos dépenses quotidiennes \n\nen opportunités d\'épargne',
              style: GoogleFonts.getFont(
                'Roboto',
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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

  Container Login(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.84,
      constraints: const BoxConstraints(
        minWidth: 320, // Set the minimum width here
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(
              minWidth: 320, // Set the minimum width here
            ),
            width: MediaQuery.sizeOf(context).width * 0.1,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              gradient: const LinearGradient(
                begin: Alignment(0.37, -0.93),
                end: Alignment(-0.37, 0.93),
                colors: [
                  Color(0xFF00001E),
                  Color.fromRGBO(0, 0, 30, 0.8),
                  Color(0xFF100E12)
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CONNEXION',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'EMAIL',
                      style: GoogleFonts.getFont('Roboto',
                          color: Colors.white, fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Container(
                      height: 35,
                      child: TextFormField(
                        controller: emailController,
                        autofocus: true,
                        obscureText: false,
                        decoration: const InputDecoration(
                          /*labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium,*/
                          contentPadding: EdgeInsets.all(14),
                          hintText: 'Votre adresse email',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          /*hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium,*/

                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: GoogleFonts.getFont('Roboto', fontSize: 13
                            // color: Colors.white,
                            ),
                        /*validator: _model.textController1Validator
                            .asValidator(context),*/
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'MOT DE PASSE',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Container(
                      height: 35,
                      child: TextFormField(
                        controller: passwordController,
                        autofocus: true,
                        obscureText: false,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(14),
                          hintText: 'Votre mot de passe',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: GoogleFonts.getFont('Roboto', fontSize: 13
                            // color: Colors.white,
                            ),
                        /* validator: textController2Validator
                            .asValidator(context),*/
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        loading ? const CircularProgressIndicator(color: Utils.primary) :  ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            onPressed: () {
                            //  control.index.value = 4;
                              Get.forceAppUpdate();

                                setState(() {
                                    loading = true;
                                });
                                _loginUser();

                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(11, 16, 114, 0.8),
                              //Color.fromARGB(255, 243, 63, 146),
                            )),
                            child: Text("Se connecter",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100,
                          height: 2,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Vous n\'avez pas de compte  ?  ',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            control.index.value = 2;
                            Get.forceAppUpdate();
                          },
                          child: Text(
                            'S\'inscrire',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: const Color(0xFFFFD700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container inscription(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.84,
      constraints: const BoxConstraints(
        minWidth: 320, // Set the minimum width here
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.4,
            height: 550,
            constraints: const BoxConstraints(
              minWidth: 320, // Set the minimum width here
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              gradient: const LinearGradient(
                begin: Alignment(0.37, -0.93),
                end: Alignment(-0.37, 0.93),
                colors: [
                  Color(0xFF00001E),
                  Color.fromRGBO(0, 0, 30, 0.8),
                  Color(0xFF100E12)
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'INSCRIPTION',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                'Prenom',
                                style: GoogleFonts.getFont('Roboto',
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                'Nom',
                                style: GoogleFonts.getFont('Roboto',
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            height: 35,
                            child: TextFormField(
                              //controller: _model.textController1,
                              autofocus: true,
                              obscureText: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(14),
                                hintText: 'Votre prenom',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: GoogleFonts.getFont('Roboto', fontSize: 13
                                  // color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            height: 35,
                            child: TextFormField(
                              //controller: _model.textController2,
                              autofocus: true,
                              obscureText: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(14),
                                hintText: 'Votre nom',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: GoogleFonts.getFont('Roboto', fontSize: 13
                                  // color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                'Date de naissance',
                                style: GoogleFonts.getFont('Roboto',
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                'Lieu de naissance',
                                style: GoogleFonts.getFont('Roboto',
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            height: 35,
                            child: TextFormField(
                              onTap: () {
                                dateChange();
                              },
                              //readOnly: true,
                              controller: dateController,
                              autofocus: true,
                              obscureText: false,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.date_range,
                                  color: Color.fromRGBO(0, 0, 30, 07),
                                ),
                                contentPadding: EdgeInsets.all(14),
                                hintText: 'Votre date de naissance',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: GoogleFonts.getFont('Roboto', fontSize: 13
                                  // color: Colors.white,
                                  ),
                              /*validator: _model.textController3Validator
                                  .asValidator(context),*/
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            height: 35,
                            child: TextFormField(
                              //controller: _model.textController4,
                              autofocus: true,
                              obscureText: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(14),
                                hintText: 'Votre lieu de naissance',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: GoogleFonts.getFont('Roboto', fontSize: 13
                                  // color: Colors.white,
                                  ),
                              /*validator:
                                              _model.textController4Validator.asValidator(context),*/
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Email',
                      style: GoogleFonts.getFont('Roboto',
                          color: Colors.white, fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Container(
                      height: 35,
                      child: TextFormField(
                        controller: emailController,
                        autofocus: true,
                        obscureText: false,
                        decoration: const InputDecoration(
                          /*labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium,*/
                          contentPadding: EdgeInsets.all(9),
                          hintText: 'Votre adresse email',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          /*hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium,*/

                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: GoogleFonts.getFont('Roboto',
                            // color: Colors.white,
                            fontSize: 13),
                        /*validator: _model.textController1Validator
                            .asValidator(context),*/
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Mot de passe',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Container(
                      height: 35,
                      child: TextFormField(
                        controller: passwordController,

                        autofocus: true,
                        obscureText: false,
                        decoration: const InputDecoration(
                          /*labelStyle: FlutterFlowTheme.of(context)
                              .la,*/
                          contentPadding: EdgeInsets.all(9),
                          hintText: 'Votre mot de passe',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          /*hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium,*/

                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: GoogleFonts.getFont('Roboto', fontSize: 13
                            // color: Colors.white,
                            ),
                        /* validator: textController2Validator
                            .asValidator(context),*/
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'Numéro telephone',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Container(
                      height: 35,
                      child: TextFormField(
                        // controller: textController2,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        obscureText: false,
                        decoration: const InputDecoration(
                          /*labelStyle: FlutterFlowTheme.of(context)
                              .la,*/

                          contentPadding: EdgeInsets.all(9),
                          hintText: 'Votre numéro',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          /*hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium,*/

                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: GoogleFonts.getFont('Roboto', fontSize: 13
                            // color: Colors.white,
                            ),
                        /* validator: textController2Validator
                            .asValidator(context),*/
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                            loading ? const CircularProgressIndicator(color: Utils.primary) : ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                    child: ElevatedButton(
                                        onPressed: () {
                                        /* control.index.value = 0;
                                        Get.forceAppUpdate(); */
                                            setState(() {
                                                loading = true;
                                            });
                                            _registerUser();
                                        },
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(
                                        Color.fromRGBO(11, 16, 114, 0.8),
                                        )),
                                        child: Text("S'inscrire",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color.fromARGB(255, 255, 255, 255))),
                                    ),
                                    ),
                                ],
                            ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100,
                          height: 2,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Vous avez dejà un compte  ?  ',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            control.index.value = 1;
                            Get.forceAppUpdate();
                          },
                          child: Text(
                            'Connexion',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: const Color(0xFFFFD700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dateChange() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != control.selectedDate.value) {
      // Mettez à jour la date sélectionnée et le champ de texte

      control.selectedDate.value = picked;
      dateController.text =
          DateFormat("dd/MM/yyyy").format(control.selectedDate.value);
    }
  }
}

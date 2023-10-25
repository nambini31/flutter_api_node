// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_node/connect/Controlleur/login/loginController.dart';
import '../../connect/Controlleur/IndexControlleur.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  double width;
  double height;
  Login({required this.height, required this.width, super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var control = Get.find<IndexControlleur>();
  LoginController _authController = LoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    // c'est pour éviter les fuites de mémoire.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width / 1.84,
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
                        controller: _emailController,
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
                        controller: _passwordController,
                        obscureText: true,
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            onPressed: () async {
                            
                              String email = _emailController
                                  .text; 
                              String password = _passwordController
                                  .text; 
                              User? user = await _authController
                                  .signInWithEmailAndPassword(email, password);

                              if (user != null) {
                               
                                control.index.value = 4;
                                Get.forceAppUpdate();
                              } else {
                               
                              }
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
}

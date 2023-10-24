// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../connect/Controlleur/IndexControlleur.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Inscription extends StatefulWidget {
  double width;
  double height;
  Inscription({required this.height, required this.width, super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  var control = Get.find<IndexControlleur>();
  TextEditingController dateController = TextEditingController();

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
            width: widget.width * 0.4,
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
                  const SizedBox(
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
                        //controller: textController1,
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
                        // controller: textController2,

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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            onPressed: () {
                              control.index.value = 0;
                              Get.forceAppUpdate();
                            },
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(11, 16, 114, 0.8),
                              //Color.fromARGB(255, 243, 63, 146),
                            )),
                            child: const Text("S'inscrire",
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

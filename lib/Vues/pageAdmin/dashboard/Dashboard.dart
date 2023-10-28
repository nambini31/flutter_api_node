// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter_api_node/Vues/pageAdmin/dashboard/Performance.dart';
import 'package:flutter_api_node/Vues/pageAdmin/dashboard/Repartition.dart';
import 'package:flutter_api_node/Vues/pageAdmin/dashboard/TabCoin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_node/Vues/pageAdmin/dashboard/TabGain.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
    String parm = "";
    @override
    void initState() {
        super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              color: Color.fromRGBO(6, 11, 39, 0.767),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                            parm = "H";
                        });
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                          "H",
                          style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                          ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                            parm = "D";
                        });
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: InkWell(
                            child: Text(
                                "J",
                                style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            onTap: () {
                                setState(() {
                                    parm = "D";
                                });
                            },
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                            parm = "W";
                        });
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "S",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                            parm = "M";
                        });
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "M",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                            parm = "SM";
                        });
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "S",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                            parm = "Y";
                        });
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "A",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Row(
              children: [Performance(param: parm,), Repartition()],
            ),
          ),
          Row(
            children: [TabCoin(), TabGain()],
          )
        ],
      ),
    );
  }
}

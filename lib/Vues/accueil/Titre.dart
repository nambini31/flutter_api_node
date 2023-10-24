// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Titre extends StatefulWidget {
  double width;
  double height;
  Titre({required this.height, required this.width, super.key});

  @override
  State<Titre> createState() => _TitreState();
}

class _TitreState extends State<Titre> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 150, // Set the minimum width here
      ),
      height: widget.width * 0.50,
      width: widget.width / 2.2,
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
                fontSize: widget.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: widget.width * 0.03),
            Text(
              'EPARGNE  INDOLORE',
              style: GoogleFonts.getFont(
                'Roboto',
                color: const Color(0xFF2DFF42),
                fontSize: widget.width * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: widget.width * 0.03),
            Text(
              'Transformez vos dépenses quotidiennes \n\nen opportunités d\'épargne',
              style: GoogleFonts.getFont(
                'Roboto',
                color: Colors.white,
                fontSize: widget.width * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

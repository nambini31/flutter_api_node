import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabGain extends StatefulWidget {
  const TabGain({super.key});

  @override
  State<TabGain> createState() => _TabGainState();
}

class _TabGainState extends State<TabGain> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      fit: FlexFit.tight,
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
        color: Color.fromRGBO(161, 61, 255, 0.534),
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('Gain',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ))),
            DataColumn(
                label: Text('%',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ))),
            DataColumn(
                label: Text('Portefeuille',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(
                '+1,05',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                '+1.85 %',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                '1 354.2 £',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_is_empty, use_key_in_widget_constructors, unnecessary_null_comparison, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures

library two_letter_icon;

import 'package:flutter/material.dart';
import 'package:flutter_api_node/Vues/Base.dart';

class TwoLetterIcon extends StatelessWidget {
  TwoLetterIcon(this.name);

  /// The text that will be used for the icon. It is truncated to 2 characters.
  final String name;

  String getName() {
    if (name != null && name.length != 0) {
      if (name.length > 2) {
        return name.substring(0, 2).toUpperCase();
      } else
        return name.toUpperCase();
    }
    return "?";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Base.primary,
          borderRadius: BorderRadius.circular(55.0),
        ),
        padding: EdgeInsets.all(4.0),
        height: 45,
        width: 45.0,
        child: Center(
          child: Text(
            getName(),
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.white, fontSize: 22),
          ),
        ));
  }
}

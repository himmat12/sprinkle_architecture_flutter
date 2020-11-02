import 'package:flutter/material.dart';

Widget wishListIcon({@required IconData icon, Color color}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(2),
    child: Icon(
      icon,
      color: color,
      size: 20,
    ),
  );
}

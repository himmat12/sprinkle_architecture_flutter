import 'package:flutter/material.dart';

Widget topBanner() {
  return Container(
    padding: EdgeInsets.all(10),
    // height: SizeConfig.blockSizeVertical * 6,
    color: Color(
      0xffffc830,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "TO ORDER CALL ",
          style: TextStyle(
            letterSpacing: 0.2,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "+9779849037497",
          style: TextStyle(
            color: Colors.blue.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(", "),
        Text(
          "+9779849037497",
          style: TextStyle(
            color: Colors.blue.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

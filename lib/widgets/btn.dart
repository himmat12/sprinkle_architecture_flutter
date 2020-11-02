import 'package:evaluation_task_flutter/size_config.dart';
import 'package:flutter/material.dart';

Widget btn({
  @required String title,
  Function onTap,
  double width,
  double height,
  Color color,
  Color textColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height == null ? 34 : height,
      width: (SizeConfig.blockSizeHorizontal * width) == null
          ? SizeConfig.blockSizeHorizontal * 100
          : SizeConfig.blockSizeHorizontal * width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Colors.amber,
      ),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    ),
  );
}

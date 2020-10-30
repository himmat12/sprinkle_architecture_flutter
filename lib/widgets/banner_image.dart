import 'package:flutter/material.dart';

Widget bannerImage({@required String url}) {
  return Card(
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: NetworkImage(url),
        ),
      ),
    ),
  );
}

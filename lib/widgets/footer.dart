import 'package:evaluation_task_flutter/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget footer(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(4, 30, 4, 10),
    height: SizeConfig.blockSizeHorizontal * 40,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 12, bottom: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  FontAwesomeIcons.facebookF,
                  size: 16,
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 6,
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  FontAwesomeIcons.instagram,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 28,
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.scaleDown,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Text('Privacy Policy',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .apply(color: Color(0xff3343a1))),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 4,
              ),
              Text('Terms and conditions',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .apply(color: Color(0xff3343a1))),
            ],
          ),
        ),
      ],
    ),
  );
}

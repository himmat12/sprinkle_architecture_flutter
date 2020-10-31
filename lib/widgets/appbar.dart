import 'package:flutter/material.dart';

Widget appBar(
    {@required BuildContext context,
    @required TextEditingController textEditingController}) {
  return AppBar(
    elevation: 0,
    title: Container(
      height: 30,
      child: Image.asset(
        'assets/logo.png',
        fit: BoxFit.scaleDown,
      ),
    ),
    bottom: PreferredSize(
      child: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.white),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 6),
          child: Container(
            height: 43,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: Colors.white),
            ),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                suffixIcon: FlatButton(
                  color: Colors.blueGrey.shade100,
                  onPressed: () {},
                  child: Text('Search'),
                ),
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                hintText: "I'm searching for...",
              ),
            ),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(48.0),
    ),
  );
}

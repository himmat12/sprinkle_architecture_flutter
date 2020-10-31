import 'package:flutter/material.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(14),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                ),
                Text(
                  'BACK',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        listOption(title: 'Top Products'),
        listOption(title: 'Trending'),
        listOption(title: 'Groceries'),
        listOption(title: 'Organic'),
      ],
    ),
  );
}

// list of options helper
Widget listOption({@required String title}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        title,
        style: TextStyle(
          letterSpacing: 0.2,
        ),
      ),
    ),
  );
}

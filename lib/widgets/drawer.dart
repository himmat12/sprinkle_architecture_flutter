import 'package:evaluation_task_flutter/providers/categories_provider.dart';
import 'package:evaluation_task_flutter/views/views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        InkWell(
          splashColor: Theme.of(context).primaryColorLight,
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                SizedBox(),
              ],
            ),
          ),
        ),
        Divider(),
        listOption(
            title: 'Top Products', context: context, category: 'top products'),
        listOption(title: 'Trending', context: context, category: 'trending'),
        listOption(title: 'Groceries', context: context),
        listOption(title: 'Organic', context: context),
      ],
    ),
  );
}

// list of options helper
Widget listOption(
    {@required BuildContext context, @required String title, String category}) {
  final CategoryProvider categoriesProvider =
      Provider.of<CategoryProvider>(context);

  return InkWell(
    splashColor: Theme.of(context).primaryColorLight,
    onTap: () {
      categoriesProvider.addCategory(category ?? 'trending');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Products()));
    },
    child: Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.2,
        ),
      ),
    ),
  );
}

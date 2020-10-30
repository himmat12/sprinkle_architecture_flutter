import 'package:evaluation_task_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ProductManager _productManager = sl<ProductManager>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // top banner
          Container(
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
          ),

          // image slider banner
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return bannerImageSlider();
              } else {
                return bannerImageSlider(height: 54);
              }
            },
          ),

          // top categorized products listview
          productCategorizedListView(
            title: 'Top Products',
            subtitle: 'View More',
            category: 'top products',
          ),

          // trending products listview
          productCategorizedListView(
            title: 'Trending',
            subtitle: 'View More',
            category: 'trending',
          ),

          // footer
          footer(context),
        ],
      ),
    );
  }
}

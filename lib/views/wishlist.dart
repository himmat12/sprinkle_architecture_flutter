import 'package:evaluation_task_flutter/providers/providers.dart';
import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/views/views.dart';
import 'package:evaluation_task_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatefulWidget {
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(12, 30, 12, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header title
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'enter your favourite here!'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashBoardPage()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Color(0xff3d3e40),
                      ),
                      Text(
                        'BACK',
                        style: TextStyle(
                          color: Color(0xff3d3e40),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 2),
          // wishlist items
          Container(
            color: Colors.white70,
            padding: EdgeInsets.fromLTRB(16, 30, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header
                Text(
                  'wishlist'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  color: Color(0xffffc830),
                  width: 80,
                  height: SizeConfig.blockSizeVertical * 0.3,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),

                // list items header
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'items'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'action'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),

                // list of items
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: wishListProvider.productList.length == 0
                      ? 1
                      : wishListProvider.productList.length,
                  itemBuilder: (context, index) {
                    return wishListProvider.productList.length == 0
                        ? emptyWishlist()
                        : Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black12),
                                right: BorderSide(color: Colors.black12),
                                left: BorderSide(color: Colors.black12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // items details
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 46,
                                      child: Text(
                                        wishListProvider
                                            .productList[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          letterSpacing: 0.3,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical * 0.3),
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal * 46,
                                      child: Text(
                                        'Rs. ' +
                                            wishListProvider
                                                .productList[index].sale_amount
                                                .toString() +
                                            ' / ' +
                                            wishListProvider
                                                .productList[index].unit,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          letterSpacing: 0.3,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // action / remove btn
                                Column(
                                  children: [
                                    // add to cart btn
                                    btn(
                                      onTap: () {},
                                      title: 'add to cart',
                                      width: 30,
                                      height: 44,
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical * 1.6),
                                    GestureDetector(
                                      onTap: () {
                                        wishListProvider.removeFromWishlist(
                                            wishListProvider
                                                .productList[index].id);
                                      },
                                      child: Text(
                                        'Remove',
                                        style: TextStyle(
                                          color: Color(0xff3343a1),
                                          decoration: TextDecoration.underline,
                                          letterSpacing: 0.3,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// empty wishlist widget
Widget emptyWishlist() {
  return Container(
    height: 54,
    padding: EdgeInsets.all(10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.black12),
        right: BorderSide(color: Colors.black12),
        left: BorderSide(color: Colors.black12),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.9,
              )),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Icon(
                Icons.favorite_outline_rounded,
                size: 28,
                color: Colors.grey.shade300,
              ),
              Positioned(
                right: 0,
                bottom: 3,
                child: Icon(
                  Icons.cancel_outlined,
                  size: 14,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
        Text(
          'wishlist is empty'.toUpperCase(),
          style: TextStyle(color: Colors.black54, letterSpacing: 0.2),
        ),
      ],
    ),
  );
}

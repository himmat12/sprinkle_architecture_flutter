import 'package:evaluation_task_flutter/managers/managers.dart';
import 'package:evaluation_task_flutter/models/models.dart';
import 'package:evaluation_task_flutter/observer.dart';
import 'package:evaluation_task_flutter/providers/providers.dart';
import 'package:evaluation_task_flutter/service_locator.dart';
import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/views/views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// categorized  products horizontal scrollable listview helper
Widget productCategorizedListViewHorizontal({
  @required BuildContext context,
  @required String title,
  @required String subtitle,
  @required String category,
  double height,
}) {
  ProductManager _productManager = sl<ProductManager>();

  return Container(
    padding: EdgeInsets.fromLTRB(12, 30, 12, 10),
    child: Column(children: [
      // header
      productsHeader(
          leadingTitle: title,
          trailing: subtitle,
          context: context,
          category: category),
      Divider(),

      // top products
      Observer<List<ProductModel>>(
        stream: _productManager.productStream(category: category),
        builder: (context, List<ProductModel> data) {
          return Container(
            height: height ?? SizeConfig.blockSizeVertical * 46,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 44.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          fit: StackFit.loose,
                          children: [
                            // image
                            Container(
                              height: SizeConfig.blockSizeVertical * 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.scaleDown,
                                    image: NetworkImage(data[index].image)),
                              ),
                            ),

                            // sale off badge
                            Positioned(
                              top: 4,
                              left: 0,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                ),
                                child: Text(
                                    data[index].discount_rate.toString() +
                                        '%' +
                                        ' off'),
                              ),
                            ),

                            // wishlist icon
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      // color: Theme.of(context).primaryColorLight,
                                      ),
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: Colors.blue.shade400,
                                    // color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),

                            // refrence badge
                            Positioned(
                              bottom: 5,
                              left: 0,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                ),
                                child: Text(
                                  data[index].refrence.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ),
                            ),

                            // wishlist icon
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      // color: Theme.of(context)
                                      //     .primaryColorLight,
                                      ),
                                  child: Icon(
                                    Icons.add_shopping_cart_outlined,
                                    // color: Colors.blue.shade400,
                                    // color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // products brief details
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index].title,
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              Text(
                                'Rs. ' +
                                    data[index].discount_amount.toString() +
                                    ' / ' +
                                    data[index].unit,
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                'Rs. ' +
                                    data[index].sale_amount.toString() +
                                    ' / ' +
                                    data[index].unit,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ]),
  );
}

// products header helper

Widget productsHeader({
  @required String leadingTitle,
  @required String trailing,
  @required String category,
  @required BuildContext context,
}) {
  final CategoryProvider categoryProvider =
      Provider.of<CategoryProvider>(context);

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingTitle,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 0.3,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: () {
            categoryProvider.addCategory(category);

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Products()));
          },
          child: Text(
            trailing,
            style: TextStyle(
              color: Colors.blue.shade800,
              fontSize: 13,
              letterSpacing: 0.3,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}

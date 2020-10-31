import 'package:evaluation_task_flutter/managers/managers.dart';
import 'package:evaluation_task_flutter/models/models.dart';
import 'package:evaluation_task_flutter/observer.dart';
import 'package:evaluation_task_flutter/providers/providers.dart';
import 'package:evaluation_task_flutter/service_locator.dart';
import 'package:evaluation_task_flutter/services/products_service.dart';
import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/views/views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCategorizedListViewHorizontal extends StatefulWidget {
  String title;
  String subtitle;
  String category;
  double height;
  ProductCategorizedListViewHorizontal({
    // @required BuildContext context,
    @required this.title,
    @required this.subtitle,
    @required this.category,
    double height,
  });

  @override
  _ProductCategorizedListViewHorizontalState createState() =>
      _ProductCategorizedListViewHorizontalState();
}

class _ProductCategorizedListViewHorizontalState
    extends State<ProductCategorizedListViewHorizontal> {
  ProductService _productService = sl<ProductService>();
  ProductManager _productManager = sl<ProductManager>();

  ProductModel product;

  bool isWishlistMarked;

  @override
  Widget build(BuildContext context) {
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(12, 30, 12, 10),
      child: Column(children: [
        // header
        productsHeader(
            leadingTitle: widget.title,
            trailing: widget.subtitle,
            context: context,
            category: widget.category),
        Divider(),

        // top products
        Observer<List<ProductModel>>(
          stream: _productManager.productStream(category: widget.category),
          builder: (context, List<ProductModel> data) {
            return Container(
              height: widget.height ?? SizeConfig.blockSizeVertical * 46,
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
                                  onTap: () {
                                    // product
                                    product = ProductModel(
                                      id: data[index].id,
                                      title: data[index].title,
                                      image: data[index].image,
                                      description: data[index].description,
                                      category: data[index].category,
                                      discount_rate: data[index].discount_rate,
                                      discount_amount:
                                          data[index].discount_amount,
                                      sale_amount: data[index].sale_amount,
                                      unit: data[index].unit,
                                      qty: data[index].qty,
                                      refrence: data[index].refrence,
                                      wishlist: data[index].wishlist,
                                    );

                                    // mark product as wishlist
                                    wishListProvider.addToWishlist(product);

                                    setState(() {
                                      data[index].wishlist = "true";
                                    });

                                    print(wishListProvider.count);
                                  },
                                  child: data[index].wishlist == "false"
                                      ? wishListIcon(
                                          icon: Icons.favorite_border_outlined,
                                          color: Colors.blue.shade400)
                                      : wishListIcon(
                                          icon: Icons.favorite,
                                          color: Colors.red),
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

                              // add to cart icon
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

// wishlist icon

Widget wishListIcon({@required IconData icon, Color color}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(2),
    child: Icon(
      icon,
      color: color,
      size: 20,
    ),
  );
}

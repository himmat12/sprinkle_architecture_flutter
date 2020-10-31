import 'package:evaluation_task_flutter/managers/managers.dart';
import 'package:evaluation_task_flutter/models/models.dart';
import 'package:evaluation_task_flutter/observer.dart';
import 'package:evaluation_task_flutter/providers/providers.dart';
import 'package:evaluation_task_flutter/service_locator.dart';
import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products>
    with TickerProviderStateMixin<Products> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar(context: context, textEditingController: _searchController),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top banner
            topBanner(),

            // product listview
            productListView(context),

            // footer
            footer(context),
          ],
        ),
      ),
    );
  }
}

// product listview

Widget productListView(BuildContext context) {
  final CategoryProvider categoryProvider =
      Provider.of<CategoryProvider>(context);

  ProductManager _productManager = sl<ProductManager>();

  return Container(
    padding: EdgeInsets.fromLTRB(12, 30, 12, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header title
        Container(
          child: Text(
            categoryProvider.category.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Showing 20 out of 100 items',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .apply(color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // super.dispose();
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

        SizedBox(height: SizeConfig.blockSizeVertical * 5),
        //  categorized products list
        Observer<List<ProductModel>>(
          stream: _productManager.productStream(
              category: categoryProvider.category),
          builder: (context, List<ProductModel> data) {
            return Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      // width: SizeConfig.blockSizeHorizontal * 44.5,
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
                                        // color: Theme.of(context)
                                        //     .primaryColorLight,
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
                            padding: EdgeInsets.all(10),
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
      ],
    ),
  );
}

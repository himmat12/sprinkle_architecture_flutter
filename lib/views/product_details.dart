import 'package:evaluation_task_flutter/managers/managers.dart';
import 'package:evaluation_task_flutter/models/models.dart';
import 'package:evaluation_task_flutter/observer.dart';
import 'package:evaluation_task_flutter/providers/providers.dart';
import 'package:evaluation_task_flutter/service_locator.dart';
import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  TextEditingController _searchController = TextEditingController();

  ProductManager _productManager = sl<ProductManager>();

  int _count = 1;

  @override
  Widget build(BuildContext context) {
    final CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context);

    final ProductDetailsProvider productDetailsProvider =
        Provider.of<ProductDetailsProvider>(context);

    return Scaffold(
      appBar:
          appBar(context: context, textEditingController: _searchController),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topBanner(),
            Container(
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
                          productDetailsProvider.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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

                  //   products details
                  Observer<List<ProductModel>>(
                    stream: _productManager.productStream(
                        id: productDetailsProvider.id),
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
                                          height:
                                              SizeConfig.blockSizeVertical * 44,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                                fit: BoxFit.scaleDown,
                                                image: NetworkImage(
                                                    data[index].image)),
                                          ),
                                        ),

                                        // sale off badge
                                        Positioned(
                                          top: 4,
                                          left: 0,
                                          child: Container(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 2, 2, 2),
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                            ),
                                            child: Text(data[index]
                                                    .discount_rate
                                                    .toString() +
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
                                            padding:
                                                EdgeInsets.fromLTRB(4, 2, 4, 2),
                                            decoration: BoxDecoration(
                                              color: Colors.lightGreen,
                                            ),
                                            child: Text(
                                              data[index]
                                                  .refrence
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // products brief details
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 18, 10, 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].title.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.2,
                                            ),
                                          ),

                                          SizedBox(height: 10),

                                          Row(
                                            children: [
                                              Text(
                                                'Rs. ' +
                                                    data[index]
                                                        .discount_amount
                                                        .toString() +
                                                    ' / ' +
                                                    data[index].unit,
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                '(Save Rs. -' +
                                                    (data[index].discount_amount -
                                                            data[index]
                                                                .sale_amount)
                                                        .toString() +
                                                    ')',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 4),

                                          Text(
                                            'Rs. ' +
                                                data[index]
                                                    .sale_amount
                                                    .toString() +
                                                ' / ' +
                                                data[index].unit,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.2,
                                            ),
                                          ),

                                          Divider(),

                                          Text(
                                            'Quantity',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.2,
                                            ),
                                          ),

                                          SizedBox(height: 2),

                                          // increment / decrement
                                          Container(
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (_count > 1) {
                                                        _count--;
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 34,
                                                    width: 34,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                    ),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 34.1,
                                                  width: 48,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                  ),
                                                  child: Text(
                                                    _count.toString(),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _count++;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 34,
                                                    width: 34,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                    ),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(height: 10),

                                          // add to cart btn
                                          btn(
                                            onTap: () {},
                                            title: 'add to cart',
                                            width: 30,
                                          ),

                                          SizedBox(height: 10),

                                          // buy now btn
                                          btn(
                                            onTap: () {},
                                            color: Color(0xff2d3d9c),
                                            textColor: Colors.white,
                                            title: 'buy now',
                                            width: 32,
                                          ),

                                          SizedBox(height: 20),

                                          Text(
                                            'Product Description',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.2,
                                            ),
                                          ),

                                          Divider(height: 30),

                                          Text(data[index].description),
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

                  // related products
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 600) {
                        return ProductCategorizedListViewHorizontal(
                          title: 'Related Products',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          category: productDetailsProvider.category,
                        );
                      } else {
                        return ProductCategorizedListViewHorizontal(
                          height: SizeConfig.blockSizeVertical * 56,
                          title: 'Related Products',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          category: productDetailsProvider.category,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

            // footer
            footer(context),
          ],
        ),
      ),
    );
  }
}

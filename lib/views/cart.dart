import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/views/views.dart';
import 'package:evaluation_task_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _count = 1;

  String _selectedDeliveryAddress;
  String _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
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
                Container(
                  alignment: Alignment.centerLeft,
                  width: SizeConfig.blockSizeHorizontal * 60,
                  child: Column(
                    children: [
                      stepsText(text: 'Step 1'),
                      stepsText(text: 'Manage Cart'),
                      Icon(Icons.arrow_downward),
                      stepsText(text: 'Step 2'),
                      stepsText(text: 'Select Address'),
                      Icon(Icons.arrow_downward),
                      stepsText(text: 'Step 3'),
                      stepsText(text: 'Select Payment'),
                    ],
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
          SizedBox(height: SizeConfig.blockSizeVertical * 4),

          // cart
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header
                Text(
                  'cart'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  color: Color(0xffffc830),
                  width: 46,
                  height: SizeConfig.blockSizeVertical * 0.3,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),

                // cart items list
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // items details
                                Container(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // product name
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 46,
                                        child: Text(
                                          'Product xx',
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
                                          height: SizeConfig.blockSizeVertical *
                                              0.3),
                                      // product price  / unit
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 46,
                                        child: Text(
                                          'Rs. ' + '120' + ' / ' + 'uint',
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
                                ),
                                SizedBox(height: 10),

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

                                //  remove btn
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(34, 10, 20, 0),
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
                                ),

                                //  sale price
                                Container(
                                  padding: EdgeInsets.fromLTRB(56, 10, 10, 0),
                                  child: Text(
                                    'Rs. ' + '120',
                                    style: TextStyle(
                                      letterSpacing: 0.3,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                Divider(),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // net total
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    'Net Total : Rs. ' + '480',
                    style: TextStyle(
                      letterSpacing: 0.3,
                      fontSize: 14,
                    ),
                  ),
                ),

                Divider(),

                // apply cupone code
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
                    child: Text(
                      'Apply Coupon Code',
                      style: TextStyle(
                        color: Color(0xff3343a1),
                        decoration: TextDecoration.underline,
                        letterSpacing: 0.3,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.blockSizeVertical * 2),

          // delivery address
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header
                Text(
                  'delivery address'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  color: Color(0xffffc830),
                  width: 164,
                  height: SizeConfig.blockSizeVertical * 0.3,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),

                // address list radio options
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  // delivery address lists
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // address radio options
                          Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  setState(() {
                                    _selectedDeliveryAddress = value;
                                  });
                                },
                                groupValue: _selectedDeliveryAddress,
                                value: 'dharan'.toLowerCase(),
                              ),
                              Text(
                                'Dharan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),

                          //  delete btn
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              // padding: EdgeInsets.fromLTRB(34, 10, 20, 0),
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                  color: Color(0xff3343a1),
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 0.3,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // address radio options
                          Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  setState(() {
                                    _selectedDeliveryAddress = value;
                                  });
                                },
                                groupValue: _selectedDeliveryAddress,
                                value: 'kathmandu'.toLowerCase(),
                              ),
                              Text(
                                'Kathmandu',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),

                          //  delete btn
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              // padding: EdgeInsets.fromLTRB(34, 10, 20, 0),
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                  color: Color(0xff3343a1),
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 0.3,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: SizeConfig.blockSizeVertical * 2),

                // add new address btn
                btn(
                  onTap: () {},
                  title: 'add new address',
                  width: 44,
                  height: 44,
                ),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.blockSizeVertical * 2),

          // payment method
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header
                Text(
                  'payment method'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  color: Color(0xffffc830),
                  width: 160,
                  height: SizeConfig.blockSizeVertical * 0.3,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),

                // payment list radio options
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),

                  // payment methods lists
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  setState(() {
                                    _selectedPaymentMethod = value;
                                  });
                                },
                                groupValue: _selectedPaymentMethod,
                                value: 'cashOnDelivery'.toLowerCase(),
                              ),
                              Text(
                                'Cash On Delivery',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  setState(() {
                                    _selectedPaymentMethod = value;
                                  });
                                },
                                groupValue: _selectedPaymentMethod,
                                value: 'khalti'.toLowerCase(),
                              ),
                              Text(
                                'Khalti',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                onChanged: (value) {
                                  setState(() {
                                    _selectedPaymentMethod = value;
                                  });
                                },
                                groupValue: _selectedPaymentMethod,
                                value: 'esewa'.toLowerCase(),
                              ),
                              Text(
                                'Esewa',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.blockSizeVertical * 2),

          // confrim order btn
          btn(
            onTap: () {},
            title: 'confrim order\nrs. 480',
            color: Color(0xff2d3d9c),
            textColor: Colors.white,
            width: 44,
            height: 54,
          ),
        ],
      ),
    );
  }
}

// simple text
Widget stepsText({String text}) {
  return Text(
    text ?? '',
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w900,
    ),
  );
}

// address radio
Widget radioTile({
  @required String radioValue,
  @required String groupValue,
  @required String title,
  Function onDelete,
  bool enableDeleteBtn = false,
}) {
  String _selectedRadio;

  return StatefulBuilder(
    builder: (context, setState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // address radio options
          Row(
            children: [
              Radio(
                onChanged: (value) {
                  setState(() {
                    _selectedRadio = value;
                  });
                },
                groupValue: _selectedRadio,
                value: radioValue,
              ),
              // Text(
              //   title,
              //   style: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w400,
              //     letterSpacing: 0.3,
              //   ),
              // ),
            ],
          ),

          //  delete btn
          enableDeleteBtn == false
              ? SizedBox()
              : GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    // padding: EdgeInsets.fromLTRB(34, 10, 20, 0),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Color(0xff3343a1),
                        decoration: TextDecoration.underline,
                        letterSpacing: 0.3,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
        ],
      );
    },
  );
}

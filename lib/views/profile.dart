import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _mobile = TextEditingController(text: '+977');
  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confrimPassword = TextEditingController();

  GlobalKey<FormState> _keyChangePasssword = GlobalKey<FormState>();
  GlobalKey<FormState> _keyProfile = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 30, 12, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // profile
          Container(
            color: Colors.white70,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header
                Text(
                  'profile'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  color: Color(0xffffc830),
                  width: 72,
                  height: SizeConfig.blockSizeVertical * 0.3,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),

                // profile form
                Form(
                  key: _keyProfile,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textInputFeild(
                          labelText: 'Full Name',
                          textEditingController: _fullName),
                      textInputFeild(
                          labelText: 'Phone Number',
                          trailingText: 'Verified',
                          textEditingController: _mobile),
                      textInputFeild(
                        labelText: 'Email',
                        trailingText: 'Verify Now',
                        trailingColor: Colors.blue,
                        textEditingController: _email,
                      ),

                      // update btn
                      btn(
                        onTap: () {},
                        title: 'update',
                        color: Color(0xff2d3d9c),
                        height: 48,
                        width: 30,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.blockSizeVertical * 2),

          // my orders
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header
                Text(
                  'my orders'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  color: Color(0xffffc830),
                  width: 98,
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
                        'details'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'status'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: SizeConfig.blockSizeVertical * 10,
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
                      Text(
                        'No Orders Yet!',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.blockSizeVertical * 2),

          // cahange password
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top header
                Text(
                  'change password'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  color: Color(0xffffc830),
                  width: 172,
                  height: SizeConfig.blockSizeVertical * 0.3,
                ),

                SizedBox(height: SizeConfig.blockSizeVertical * 2),

                // change password form
                Form(
                  key: _keyChangePasssword,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textInputFeild(
                        labelText: 'Passowrd',
                        textEditingController: _password,
                        obscureText: true,
                        enableObscureText: true,
                      ),
                      textInputFeild(
                        labelText: 'New Passowrd',
                        textEditingController: _newPassword,
                        obscureText: false,
                        enableObscureText: true,
                      ),
                      textInputFeild(
                        labelText: 'Confrim New Password',
                        textEditingController: _confrimPassword,
                        obscureText: true,
                        enableObscureText: true,
                      ),

                      // update btn
                      btn(
                        onTap: () {},
                        title: 'change password',
                        color: Color(0xff2d3d9c),
                        height: 48,
                        width: 46,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //  logout  btn
          GestureDetector(
            onTap: () {},
            child: Text(
              'Logout',
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
    );
  }
}

// text form feild
Widget textInputFeild({
  String labelText,
  String trailingText,
  Color trailingColor,
  Function onTrailingTap,
  Function onSuffixInputTextTap,
  bool enableObscureText = false,
  bool obscureText,
  TextEditingController textEditingController,
}) {
  bool _show = obscureText ?? false;

  return StatefulBuilder(
    builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labelText ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                  letterSpacing: 0.4,
                ),
              ),
              GestureDetector(
                onTap: onTrailingTap,
                child: Text(
                  trailingText ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: trailingColor ?? Colors.black87,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: TextFormField(
              obscureText: _show,
              controller: textEditingController,
              decoration: InputDecoration(
                suffixIcon: enableObscureText == false
                    ? SizedBox()
                    : GestureDetector(
                        onTap: () {},
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              _show = !_show;
                            });
                          },
                          child: Text(
                            _show == true ? 'Show' : 'Hide',
                            style: TextStyle(),
                          ),
                        ),
                      ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 14),
        ],
      );
    },
  );
}

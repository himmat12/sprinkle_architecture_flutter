import 'package:evaluation_task_flutter/size_config.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().initSize(context);

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                horizointalList(context: context),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 60,
                    height: SizeConfig.blockSizeVertical * 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  horizointalList(context: context, height: 40, width: 100),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 40,
                          height: SizeConfig.blockSizeVertical * 50,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 40,
                          height: SizeConfig.blockSizeVertical * 50,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Widget horizointalList({BuildContext context, double height, double width}) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      width: SizeConfig.blockSizeHorizontal * (width ?? 100.0),
      height: SizeConfig.blockSizeVertical * (height ?? 30.0),
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            width: 100,
            color: Colors.red,
            child: Center(
              child: Text('data ' + index.toString()),
            ),
          );
        },
      ),
    ),
  );
}

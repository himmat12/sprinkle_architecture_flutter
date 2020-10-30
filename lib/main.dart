import 'package:evaluation_task_flutter/service_locator.dart';
import 'package:evaluation_task_flutter/test.dart';
import 'package:evaluation_task_flutter/views/views.dart';
import 'package:flutter/material.dart';

void main() {
  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TestPage(),
      theme: ThemeData(
        primaryColor: Color(0xff2d3d9c),
      ),
      home: DashBoardPage(),
    );
  }
}

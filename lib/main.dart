import 'package:evaluation_task_flutter/providers/providers.dart';
import 'package:evaluation_task_flutter/service_locator.dart';
import 'package:evaluation_task_flutter/test.dart';
import 'package:evaluation_task_flutter/views/views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setUp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TestPage(),
      title: 'Gordeli Shoping',
      theme: ThemeData(
        primaryColor: Color(0xff2d3d9c),
      ),
      home: DashBoardPage(),
    );
  }
}

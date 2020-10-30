import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/views/home.dart';
import 'package:evaluation_task_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> bottomNavigationTabs = [
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().initSize(context);

    return Scaffold(
      appBar: appBar(context: context, controller: _searchController),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xff3343a1),
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30.0,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            // ignore: deprecated_member_use
            title: Text('Wish List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            // ignore: deprecated_member_use
            title: Text('Wish List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            // ignore: deprecated_member_use
            title: Text('Wish List'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            bottomNavigationTabs[_selectedIndex],
          ],
        ),
      ),
    );
  }
}

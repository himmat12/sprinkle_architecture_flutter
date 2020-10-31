import 'package:evaluation_task_flutter/size_config.dart';
import 'package:evaluation_task_flutter/views/home.dart';
import 'package:evaluation_task_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with TickerProviderStateMixin<DashBoardPage> {
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

  AnimationController _hide;

  @override
  void initState() {
    super.initState();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    _hide.dispose();
  }

  bool _hideScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;

        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().initSize(context);

    return NotificationListener(
      onNotification: _hideScrollNotification,
      child: Scaffold(
        appBar: appBar(context: context, controller: _searchController),
        drawer: drawer(context),
        bottomNavigationBar: ClipRect(
          child: SizeTransition(
            sizeFactor: _hide,
            axisAlignment: -1.0,
            child: BottomNavigationBar(
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
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              bottomNavigationTabs[_selectedIndex],
            ],
          ),
        ),
      ),
    );
  }
}

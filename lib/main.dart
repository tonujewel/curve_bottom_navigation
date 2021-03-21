import 'package:bottom_navigation/bottom_navigation/curve_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        decoration: BoxDecoration(color: Colors.green),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: CurveBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.home,
            title: "one",
          ),
          TabData(
            iconData: Icons.search,
            title: "two",
          ),
          TabData(iconData: Icons.shopping_cart, title: "three", onclick: () {}),
          TabData(iconData: Icons.shopping_cart, title: "four"),
          TabData(iconData: Icons.shopping_cart, title: "five"),
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Text('one');
      case 1:
        return Text('two');
      case 2:
        return Text('three');
      case 3:
        return Text('four');
      default:
        return Text('five');
    }
  }
}

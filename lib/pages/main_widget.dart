import 'package:flutter/material.dart';
import 'package:online_shop_app/pages/store/cart_page.dart';
import 'package:online_shop_app/pages/home_page/home_page.dart';
import 'account_page/account_page.dart';

class FullHomePage extends StatelessWidget {
  const FullHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(0),
      body: const HomePage(),
      bottomNavigationBar: getBottomNavBar(0, context),
    );
  }
}

class FullCartPage extends StatelessWidget {
  const FullCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(1),
      body: CartPage(),
      bottomNavigationBar: getBottomNavBar(1, context),
    );
  }
}

class FullAccountPage extends StatelessWidget {
  const FullAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(2),
      body: const AccountPage(),
      bottomNavigationBar: getBottomNavBar(2, context),
    );
  }
}

getAppBar(int currentScreenIndex) {
  switch (currentScreenIndex) {
    case 0:
      return null;
    case 1:
      return AppBar(
        elevation: 0.8,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "CART",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

    case 2:
      return AppBar(
        elevation: 0.8,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "ACCOUNT",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

    default:
      return null;
  }
}

Widget getBottomNavBar(currentScreenIndex, context) {
  List navBarItems = [
    {"icon": Icons.home, "size": 32.0},
    {"icon": Icons.shopping_cart, "size": 32.0},
    {"icon": Icons.person, "size": 32.0}
  ];

  List bodyWidgets = [
    const FullHomePage(),
    const FullCartPage(),
    const FullAccountPage(),
  ];

  return Container(
    height: 75,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2)))),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(navBarItems.length, (index) {
            return IconButton(
                icon: Icon(
                  navBarItems[index]['icon'],
                  size: navBarItems[index]['size'],
                  color: currentScreenIndex == index
                      ? Colors.amberAccent.shade700
                      : Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => bodyWidgets[index]),
                  );
                });
          })),
    ),
  );
}

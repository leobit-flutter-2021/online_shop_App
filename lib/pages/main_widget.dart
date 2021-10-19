import 'package:flutter/material.dart';
import 'home_page.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int currentScreenIndex = 0;
  // appbar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getBottomNavBar(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: currentScreenIndex,
      children: [
        HomePage(),
      ],
    );
  }

  getAppBar() {
    switch (currentScreenIndex) {
      case 0:
        return null;
      case 1:
        return null;

      case 2:
        return AppBar(
          elevation: 0.8,
          backgroundColor: Colors.white,
          title: Text(
            "ACCOUNT",
            style: const TextStyle(color: Colors.black),
          ),
        );

      default:
        return null;
    }
  }

  Widget getBottomNavBar() {
    List navBarItems = [
      {"icon": Icons.home, "size": 32.0},
      {"icon": Icons.location_on_sharp, "size": 32.0},
      {"icon": Icons.person, "size": 32.0}
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
                    setState(() {
                      currentScreenIndex = index;
                    });
                  });
            })),
      ),
    );
  }
}

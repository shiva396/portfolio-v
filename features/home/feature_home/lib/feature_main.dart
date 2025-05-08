import 'package:flutter/material.dart';

import 'pages/contact.dart';
import 'pages/profile.dart';
import 'pages/story.dart';
import 'pages/work.dart';

class gotoMainPage extends StatefulWidget {
  const gotoMainPage({super.key});

  @override
  State<gotoMainPage> createState() => _gotoMainPageState();
}

class _gotoMainPageState extends State<gotoMainPage> {
  List<Widget> pages = const [
    storyPage(),
    workPage(),
    ContactPage(),
    profilePage(),
  ];
  int _index = 0;

  Widget customNavigationBar({required Alignment alignment}) {
    return Align(
      alignment: alignment,
      child: Container(
        color: Colors.black.withOpacity(0.75), // Set opacity to 75%
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _index = i;
                });
              },
              child: Icon(
                Icons.circle, // Replace with your desired icons
                color: _index == i ? Colors.white : Colors.grey,
                size: 30,
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return Scaffold(
            body: Stack(
              children: [
                IndexedStack(
                  children: pages,
                  index: _index,
                ),
                Positioned(
                  bottom: 20, // Adjust the vertical position
                  left: 20, // Adjust the horizontal position
                  right: 20, // Adjust the horizontal position
                  child: customNavigationBar(
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Stack(
              children: [
                IndexedStack(
                  children: pages,
                  index: _index,
                ),
                Positioned(
                  top: 20, // Adjust the vertical position for larger screens
                  left: 20,
                  right: 20,
                  child: customNavigationBar(
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

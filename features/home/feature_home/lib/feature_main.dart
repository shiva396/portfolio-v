import 'package:flutter/material.dart';

import 'pages/chat.dart';
import 'pages/hey.dart';
import 'pages/story.dart';
import 'pages/work.dart';

class gotoMainPage extends StatefulWidget {
  const gotoMainPage({super.key});

  @override
  State<gotoMainPage> createState() => _gotoMainPageState();
}

class _gotoMainPageState extends State<gotoMainPage> {
  List<Widget> pages = const [
   HeyPage(),
   WorkPage(),
   StoryPage(),
   ChatPage(),
  ];

  List<String> barItems = ['Story', 'Hey', 'Work', 'Story', 'Chat'];

  int _index = 0;

  // Custom navigation bar widget
  Widget customNavigationBar({required Alignment alignment}) {
    return Align(
      alignment: alignment,
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 70),
        height: 30,
        width: 270,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.generate(barItems.length, (i) {
            bool isSelected = _index == i;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _index = i;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 30,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.yellow.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: i == 0
                      ? Icon(
                          Icons.wb_sunny_outlined,
                          size: 20,
                          color: isSelected ? Colors.amberAccent : Colors.grey,
                        )
                      : Text(
                          barItems[i],
                          style: TextStyle(
                            color:
                                isSelected ? Colors.amberAccent : Colors.grey,
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                ),
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
                  index: _index,
                  children: pages,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: customNavigationBar(alignment: Alignment.center),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Stack(
              children: [
                IndexedStack(
                  index: _index,
                  children: pages,
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: customNavigationBar(alignment: Alignment.center),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

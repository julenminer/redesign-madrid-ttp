import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ttpmadridredesign/card/card_page_gui.dart';
import 'package:ttpmadridredesign/recharge/recharge_page_gui.dart';

import 'add_card_gui.dart';

class HomeGUI extends StatefulWidget {
  HomeGUI({this.cardNumber});

  String cardNumber;
  @override
  _HomeGUIState createState() => _HomeGUIState();
}

class _HomeGUIState extends State<HomeGUI> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<Widget> _pages;

  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    _pages = [CardPageGUI(widget.cardNumber), RechargePageGUI()];

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          if (_currentIndex != newIndex) {
            controller.forward().then((value) {
              setState(() {
                _currentIndex = newIndex;
              });
              controller.reverse();
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              title: Text("Card"), icon: Icon(Icons.credit_card)),
          BottomNavigationBarItem(
              title: Text("Recharge"), icon: Icon(Icons.add_shopping_cart)),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text(
                "Transport Card of Madrid",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Stack(
                children: [
                  SlideTransition(
                    position: offset,
                    child: SizedBox.expand(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _pages[_currentIndex],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 5,
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

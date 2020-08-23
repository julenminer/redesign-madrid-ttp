import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttpmadridredesign/card/card_page_gui.dart';
import 'package:ttpmadridredesign/usage_history_gui.dart';

import 'add_card_gui.dart';

class HomeGUI extends StatefulWidget {
  HomeGUI({this.cardNumber});

  String cardNumber;
  @override
  _HomeGUIState createState() => _HomeGUIState();
}

class _HomeGUIState extends State<HomeGUI> {
  int _currentIndex = 0;
  List<Widget> _pages;

  @override
  void initState() {
   _pages = [CardPageGUI(widget.cardNumber), Container()];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Transport Card of Madrid",
          style: GoogleFonts.lato(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(title: Text("Card"), icon: Icon(Icons.credit_card)),
          BottomNavigationBarItem(title: Text("Recharge"), icon: Icon(Icons.add_shopping_cart)),
        ],
      ),
      body: SafeArea(
          child: _pages[_currentIndex]),
    );
  }
}

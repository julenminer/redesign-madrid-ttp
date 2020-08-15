import 'package:flutter/material.dart';

class AddCardGUI extends StatefulWidget {
  @override
  _AddCardGUIState createState() => _AddCardGUIState();
}

class _AddCardGUIState extends State<AddCardGUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Add card"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/holding-phone-colour-800px.png")
            ],
          )
        ],
      )),
    );
  }
}

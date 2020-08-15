import 'package:flutter/material.dart';

import 'add_card_gui.dart';

class HomeGUI extends StatefulWidget {
  HomeGUI({this.cardNumber});

  String cardNumber;
  @override
  _HomeGUIState createState() => _HomeGUIState();
}

class _HomeGUIState extends State<HomeGUI> {
  String _cardNumber;

  @override
  void initState() {
    super.initState();
    _cardNumber = widget.cardNumber;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Transport Card of Madrid"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: Card(
                elevation: 3,
                child: _cardNumber == null ? InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardGUI()));
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 80,
                        ),
                        SizedBox(height: 16,),
                        Text(
                          "Add card",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? Colors.black
                                  : Colors.white),
                        )
                      ],
                    ),
                  ),
                ) : Container(),
              ),
            ),
            Flexible(
              child: Card(
                elevation: 3,
                child: Center(
                    child: Text(
                  "Coming soon",
                  style: Theme.of(context).textTheme.headline5,
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}

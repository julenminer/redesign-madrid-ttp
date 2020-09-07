import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpmadridredesign/card/card_provider.dart';

import '../add_card_gui.dart';

class CardAddGUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardProvider = Provider.of<CardProvider>(context);

    return Column(
      children: [
        Image.asset("assets/drawkit-transport-scene-8.png"),
        SizedBox(height: 32,),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add your transport\ncard of Madrid",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16,),
              Text(
                "Add your transport card information to see "
                "the situation of your card balance, to see the usage "
                "history and to be able to recharge it whenever "
                "you need it.",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045),
              )
            ],
          ),
        ),
        CupertinoButton.filled(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Add card",
              )
            ],
          ),
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCardGUI()))
                .then((value) {
              if (value != null) {
                cardProvider.cardNumber = value;
              }
            });
          },
          borderRadius: BorderRadius.circular(25),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpmadridredesign/card/card_provider.dart';

import '../add_card_gui.dart';

class CardAddGUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardProvider = Provider.of<CardProvider>(context);

    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddCardGUI()))
              .then((value) {
            if (value != null) {
              cardProvider.cardNumber = value;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: MediaQuery.of(context).size.width * 0.2,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Add card",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(
                      color: Theme.of(context).brightness ==
                          Brightness.light
                          ? Colors.black
                          : Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

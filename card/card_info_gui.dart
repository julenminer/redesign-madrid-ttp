import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttpmadridredesign/card/card_provider.dart';

import '../usage_history_gui.dart';

class CardInfoGUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardProvider = Provider.of<CardProvider>(context);

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/crtm-logo.png",
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "ABONO 30 DÍAS JOVEN T. PLANA",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text("Last valid day"),
          Text(
            "Thursday june 25, 2020",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text("Recharge date"),
          Text(
            "Wednesday may 27, 2020",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Text("First usage date"),
          Text(
            "Wednesday may 27, 2020",
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),
          Text(
            "Card number\n001 001 001 001 0000023768",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/card-logos.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          CupertinoButton.filled(
            child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  "View usage history",
                  textAlign: TextAlign.center,
                )),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UsageHistoryGui()));
            },
            borderRadius: BorderRadius.circular(25),
          ),
          SizedBox(
            height: 16,
          ),
          CupertinoButton.filled(
            child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  "Remove card",
                  textAlign: TextAlign.center,
                )),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove("cardNumber");
              cardProvider.removeCardNumber();
            },
            borderRadius: BorderRadius.circular(25),
          ),
        ],
      ),
    );
  }
}

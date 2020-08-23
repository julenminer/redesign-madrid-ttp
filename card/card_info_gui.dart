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
                  style: Theme.of(context).textTheme.headline6,
                ),
              )),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert),
                onSelected: (String result) async {
                  switch (result) {
                    case "history":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsageHistoryGui()));
                      break;
                    case "remove":
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove("cardNumber");
                      cardProvider.removeCardNumber();
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: "history",
                    child: Text('View usage history'),
                  ),
                  const PopupMenuItem<String>(
                    value: "remove",
                    child: Text('Remove card'),
                  )
                ],
              )
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/card-logos.png",
                width: 130,
              ),
            ],
          )
        ],
      ),
    );
  }
}

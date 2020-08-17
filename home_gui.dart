import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                child: _cardNumber == null
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddCardGUI()))
                              .then((value) {
                            if (value != null) {
                              if (mounted) {
                                setState(() {
                                  _cardNumber = value;
                                });
                              }
                            }
                          });
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: 80,
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
                      )
                    : Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/crtm-logo.png",
                            width: 90,
                          ),
                          Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "ABONO 30 DÍAS JOVEN T. PLANA",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              )),
                          IconButton(icon: Icon(Icons.more_vert), onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.remove("cardNumber");
                            if(mounted) {
                              setState(() {
                                _cardNumber = null;
                              });
                            }
                          })
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
                          Image.asset("assets/card-logos.png", width: 130,),
                        ],
                      )
                    ],
                  ),
                ),
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

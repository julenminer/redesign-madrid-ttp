import 'package:flutter/material.dart';

class HomeGUI extends StatefulWidget {
  @override
  _HomeGUIState createState() => _HomeGUIState();
}

class _HomeGUIState extends State<HomeGUI> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Transport Card of Madrid"),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: size.height / 2.7,
              child: Card(
                child: Center(child: Text("Coming soon", style: Theme.of(context).textTheme.headline5,)),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: size.height / 2.7,
              child: Card(
                child: Center(child: Text("Coming soon", style: Theme.of(context).textTheme.headline5,)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
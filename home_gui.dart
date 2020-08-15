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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: size.height / 2.7,
              child: Card(
                elevation: 3,
                child: AddCardWidget(),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: size.height / 2.7,
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

class AddCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              size: 50,
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
    );
  }
}

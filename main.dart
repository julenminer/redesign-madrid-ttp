import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttpmadridredesign/home_gui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();
  String cardNumber = pref.getString("cardNumber");
  runApp(MyApp(
    cardNumber: cardNumber,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({this.cardNumber});

  String cardNumber;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRTM',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeGUI(
        cardNumber: cardNumber,
      ),
    );
  }
}

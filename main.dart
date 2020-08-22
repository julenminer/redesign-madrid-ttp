import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        textTheme: GoogleFonts.montserratTextTheme(),
        brightness: Brightness.light,
        primarySwatch: MaterialColor(0xFFc43b22, color),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeGUI(
        cardNumber: cardNumber,
      ),
    );
  }

  Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
}

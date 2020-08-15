import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCardGUI extends StatefulWidget {
  @override
  _AddCardGUIState createState() => _AddCardGUIState();
}

class _AddCardGUIState extends State<AddCardGUI> {
  var _numbers = ["001", "002", "003", "175", "251"];
  String _selectedNumber;

  @override
  void initState() {
    super.initState();
    _selectedNumber = _numbers[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Add card"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 80,
                        child: Image.asset(
                            "assets/holding-phone-colour-800px.png")),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                        child: Text(
                            "Hold your transport card near your phone to read it using NFC"))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("OR"),
                      ),
                      Flexible(
                        child: Divider(),
                      )
                    ],
                  ),
                ),
                Text("Write the number of the card"),
                Image.asset("assets/card-example.png"),
                Row(
                  children: [
                    Card(
                      shape: new RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Colors.lightGreenAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0)),
                      color: Colors.transparent,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: _selectedNumber,
                            items: (_numbers.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedNumber = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Number",
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(8))),
                    ))
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: CupertinoButton(
                    color: Colors.red,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString("cardNumber", "001-0000023768");
                      Navigator.pop(context, prefs.getString("cardNumber"));
                    },
                    child: Text("Save"),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

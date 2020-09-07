import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsageHistoryGui extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Text("Usage history"),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListElement(
                  TransportType.cercanias,
                  "Sol",
                  DateTime(2020, 08, 11, 13, 22),
                  "Nuevos Ministerios",
                  DateTime(2020, 08, 11, 14, 7)),
              ListElement(
                  TransportType.metro,
                  "Sol",
                  DateTime(2020, 08, 10, 11, 02),
                  null,
                  null),
              ListElement(
                  TransportType.bus,
                  "Gran Vía 25",
                  DateTime(2020, 08, 2, 16, 34),
                  null,
                  null),
            ],
          ),
        ),
      ),
    );
  }
}

enum TransportType { metro, cercanias, bus }

class ListElement extends StatelessWidget {
  ListElement(this.transportType, this.fromName, this.fromDate, this.toName,
      this.toDate);

  TransportType transportType;
  String fromName;
  String toName;
  DateTime fromDate;
  DateTime toDate;

  @override
  Widget build(BuildContext context) {
    String assetName = "";
    switch (transportType) {
      case TransportType.metro:
        assetName = "assets/MetroMadridLogo.png";
        break;
      case TransportType.cercanias:
        assetName = "assets/1024px-Cercanias_Logo.svg.png";
        break;
      case TransportType.bus:
        assetName = "assets/lineas_emt.png";
        break;
    }
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(assetName,
                width: MediaQuery.of(context).size.width * 0.07),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  fromName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(dateString(fromDate))
              ]
              + (transportType == TransportType.cercanias ? <Widget>[Icon(Icons.arrow_downward),
                    Text(
                      toName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(dateString(toDate)),] :[]),
            )
          ],
        ),
      ),
    );
  }

  String dateString(DateTime date) {
    String returnString;
    if (date.day < 10) {
      returnString = "0" + date.day.toString();
    } else {
      returnString = date.day.toString();
    }
    returnString += "/";
    if (date.month < 10) {
      returnString += "0" + date.month.toString();
    } else {
      returnString += date.month.toString();
    }
    returnString += "/";

    returnString += date.year.toString();

    returnString += " · ";

    if (date.hour < 10) {
      returnString += "0" + date.hour.toString();
    } else {
      returnString += date.hour.toString();
    }
    returnString += ":";
    if (date.minute < 10) {
      returnString += "0" + date.minute.toString();
    } else {
      returnString += date.minute.toString();
    }
    return returnString;
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpmadridredesign/card/card_add_gui.dart';
import 'package:ttpmadridredesign/card/card_info_gui.dart';
import 'package:ttpmadridredesign/card/card_provider.dart';

class CardPageGUI extends StatelessWidget {
  CardPageGUI(this.cardNumber);
  String cardNumber;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardProvider>(
      create: (_) => new CardProvider(cardNumber),
      child: Consumer<CardProvider>(
        builder: (context, cardProviderNotifier, child) {
          return cardProviderNotifier.cardNumber == null
              ? CardAddGUI()
              : SingleChildScrollView(child: CardInfoGUI());
        },
      ),
    );
  }
}

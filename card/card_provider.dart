import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier{
  CardProvider(this._cardNumber);
  String _cardNumber;

  String get cardNumber {
    return _cardNumber;
  }

  set cardNumber(String cardNumber){
    _cardNumber = cardNumber;
    notifyListeners();
  }

  void removeCardNumber() {
    _cardNumber = null;
    notifyListeners();
  }
}
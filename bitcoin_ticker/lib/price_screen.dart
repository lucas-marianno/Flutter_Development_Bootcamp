import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<DropdownMenuItem<String>> dropDownMenuItemList = [];
  List<Widget> cupertinoPickerItenList = [];
  Widget currencySelector = const Placeholder();

  bool a = Platform.isAndroid;
  void getDropDownItens() {
    for (String currency in currenciesList) {
      dropDownMenuItemList.add(DropdownMenuItem(value: currency, child: Text(currency)));
    }
  }

  void getPickerItens() {
    for (String currency in currenciesList) {
      cupertinoPickerItenList.add(Text(currency));
    }
  }

  void createCurrencySelector() {
    if (Platform.isIOS) {
      getPickerItens();
      currencySelector = CupertinoPicker(
        itemExtent: 30,
        onSelectedItemChanged: (value) {},
        children: cupertinoPickerItenList,
      );
    } else {
      getDropDownItens();
      currencySelector = DropdownButton<String>(
        onChanged: (value) {
          setState(() {
            selectedCurrency = value!;
          });
        },
        value: selectedCurrency,
        items: dropDownMenuItemList,
      );
    }
  }

  @override
  void initState() {
    createCurrencySelector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: currencySelector,
          ),
        ],
      ),
    );
  }
}

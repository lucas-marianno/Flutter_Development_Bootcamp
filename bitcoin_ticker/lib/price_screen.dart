import 'dart:async';
import 'dart:convert';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'dart:io'; uncomment to access Platform.
import 'package:http/http.dart' as http;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';
  List<String> cryptos = ['BTC', 'ETH', 'LTC'];
  Map<String, double> rates = {};
  List<Widget> cupertinoPickerItenList = [];
  Widget currencySelector = const Placeholder();
  DataGetter dataGetter = DataGetter();

  // List<DropdownMenuItem<String>> dropDownMenuItemList = [];
  // Enable for Android:
  // bool a = Platform.isAndroid;
  // void getDropDownItens() {
  //   for (String currency in currenciesList) {
  //     dropDownMenuItemList.add(DropdownMenuItem(value: currency, child: Text(currency)));
  //   }
  // }

  void getPickerItens() {
    for (String currency in currenciesList) {
      cupertinoPickerItenList.add(Text(
        currency,
        style: const TextStyle(color: Colors.white),
      ));
    }
  }

  void createCurrencySelector() {
    getPickerItens();
    currencySelector = CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (value) {
        Timer(Duration(milliseconds: 500), () {});
        setState(() {
          selectedCurrency = currenciesList[value];
          getRates();
        });
      },
      children: cupertinoPickerItenList,
    );

    // getDropDownItens();
    // currencySelector = DropdownButton<String>(
    //   onChanged: (value) {
    //     setState(() {
    //       selectedCurrency = value!;
    //     });
    //   },
    //   value: selectedCurrency,
    //   items: dropDownMenuItemList,
    // );
  }

  getRates() async {
    for (String crypto in cryptos) {
      await dataGetter.getRates(crypto, selectedCurrency);
      http.Response response = dataGetter.response;
      if (response.statusCode == 200) {
        var data = await jsonDecode(response.body);
        setState(() {
          rates.addAll({crypto: data['rate']});
        });
      } else {
        print(response.statusCode);
      }
    }
  }

  @override
  void initState() {
    createCurrencySelector();
    getRates();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CurrencyTile(crypto: 'BTC', rate: rates['BTC'], selectedCurrency: selectedCurrency),
              CurrencyTile(crypto: 'ETH', rate: rates['ETH'], selectedCurrency: selectedCurrency),
              CurrencyTile(crypto: 'LTC', rate: rates['LTC'], selectedCurrency: selectedCurrency),
            ],
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

double limitDecimals(double n, int limit) {
  String newN = n.toString();
  int end = newN.indexOf('.') + limit + 1;
  if (end > newN.length) {
    return n;
  }
  return double.parse(newN.substring(0, end));
}

class CurrencyTile extends StatelessWidget {
  const CurrencyTile({
    super.key,
    required this.crypto,
    required this.rate,
    required this.selectedCurrency,
  });
  final String crypto;
  final double? rate;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    String newrate = '';
    if (rate == null) {
      newrate = '?';
    } else {
      newrate = limitDecimals(rate!, 2).toString();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $newrate $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DataGetter {
  late http.Response response;
  DateTime? _lastRequest;
  int delay = -2000;

  Future<void> getRates(String crypto, String selectedCurrency) async {
    if (_lastRequest == null || _lastRequest!.difference(DateTime.now()).inMilliseconds < delay) {
      http.Response _response = await http.get(
        Uri.parse('https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency'),
        headers: {'X-CoinAPI-Key': '75F03410-E6AD-4A59-9950-8CF566FE2A9E'},
      );

      response = _response;
      _lastRequest = DateTime.now();
      print(response.body);
    } else {
      await Future.delayed(Duration(milliseconds: delay), () {
        getRates(crypto, selectedCurrency);
      });
    }
  }
}

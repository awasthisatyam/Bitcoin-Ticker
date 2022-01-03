import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '2BBC34D5-8C1D-4BF4-8E6E-AC152F32AC3C';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    List<double> price = [];

    var requestURL =
        Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey');
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      price.add(lastPrice);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    //
    requestURL = Uri.parse('$coinAPIURL/ETH/$selectedCurrency?apikey=$apiKey');
    response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      price.add(lastPrice);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    //
    requestURL = Uri.parse('$coinAPIURL/LTC/$selectedCurrency?apikey=$apiKey');
    response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      price.add(lastPrice);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return price;
  }
}

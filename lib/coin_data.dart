import 'package:http/http.dart' as http;
import 'dart:convert';

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

// API CONNECTION AND STUFF
class CoinData {
  Future<dynamic> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoRateValues = {};

    for (String crypto in cryptoList) {
      String coinAPIURL =
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency';
//    const apiKey = 'B9337C01-B193-4C25-8711-C0C273D7AB38';  // MY EMAIL KEY
//      const apiKey2 = '01C0B3F6-D5B6-40EF-A1C9-621A7A7727B8'; // FENGS EMAIL KEY
      const apiKey3 = '135B3C64-49D3-4BDF-A169-53D7448CF6FD'; //2RU EMAIL

      http.Response response = await http.get('$coinAPIURL/?apiKey=$apiKey3');

      if (response.statusCode == 200) {
        var data = response.body;
        double decodedRate = jsonDecode(data)['rate'];
        // Adding the decoded rate to the CryptoRateValues List
        cryptoRateValues[crypto] = decodedRate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoRateValues;
  }
}

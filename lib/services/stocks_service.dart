import 'dart:convert';
import 'package:validus_coin/model/stocks.dart';
import 'package:http/http.dart' as http;

class StocksService {
  Future<Stocks> getStocks() async {
    try {
      http.Response response = await http.get(Uri.parse('https://run.mocky.io/v3/fc3ddccf-855c-4bb6-861c-cf7896aa963e'));
      Stocks stocks = Stocks.fromJson(json.decode(response.body));
      return stocks;
    } catch (error) {
      rethrow;
    }
  }
}

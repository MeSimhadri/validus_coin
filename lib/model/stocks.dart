import 'package:json_annotation/json_annotation.dart';
part 'stocks.g.dart';

@JsonSerializable()
class Stocks {
  bool? success;
  int? statusCode;
  @JsonKey(fromJson: _fromJsonStock, toJson: _toJsonStock)
  List<Stock> data = [];

  static List<Stock> _fromJsonStock(List<dynamic> stock) {
    List<Stock> data = [];
    for (var element in stock) {
      data.add(Stock.fromJson(element));
    }
    return data;
  }

  static List<Map<String, dynamic>> _toJsonStock(List<dynamic> stock) {
    return stock.map((e) => Stock().toJson()).toList();
  }

  Stocks({this.success, this.statusCode, required this.data});

  factory Stocks.fromJson(Map<String, dynamic> json) => _$StocksFromJson(json);
  Map<String, dynamic> toJson() => _$StocksToJson(this);
}

@JsonSerializable()
class Stock {
  String? id;
  String? stockName;
  double? price;
  double? dayGain;
  String? lastTrade;
  String? extendedHours;
  double? lastPrice;

  Stock({this.id, this.stockName, this.price, this.dayGain, this.lastTrade, this.extendedHours, this.lastPrice});

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
  Map<String, dynamic> toJson() => _$StockToJson(this);
}

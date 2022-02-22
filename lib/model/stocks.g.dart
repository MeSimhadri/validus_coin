// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stocks _$StocksFromJson(Map<String, dynamic> json) => Stocks(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      data: Stocks._fromJsonStock(json['data'] as List),
    );

Map<String, dynamic> _$StocksToJson(Stocks instance) => <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'data': Stocks._toJsonStock(instance.data),
    };

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      id: json['id'] as String?,
      stockName: json['stockName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      dayGain: (json['dayGain'] as num?)?.toDouble(),
      lastTrade: json['lastTrade'] as String?,
      extendedHours: json['extendedHours'] as String?,
      lastPrice: (json['lastPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'id': instance.id,
      'stockName': instance.stockName,
      'price': instance.price,
      'dayGain': instance.dayGain,
      'lastTrade': instance.lastTrade,
      'extendedHours': instance.extendedHours,
      'lastPrice': instance.lastPrice,
    };

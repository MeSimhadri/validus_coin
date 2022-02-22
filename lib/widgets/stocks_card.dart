import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validus_coin/model/stocks.dart';

Card stocksCard(Stock stock) {
  return Card(
    margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [Text((stock.stockName ?? '').toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600))],
          ),
          const SizedBox(height: 8),
          cardDetailRow(title: 'Price', info: stock.price!.toStringAsFixed(2).toString()),
          cardDetailRow(title: 'Day gain', info: stock.lastPrice!.toStringAsFixed(2).toString() + ' - ' + stock.price!.toStringAsFixed(2).toString()),
          cardDetailRow(title: 'Last trade', info: DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(stock.lastTrade ?? '0')))),
          cardDetailRow(title: 'Extended hrs', info: DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(stock.extendedHours ?? '0')))),
          cardDetailRow(title: '%Change', info: stock.dayGain.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '%Change',
                style: TextStyle(color: Color(0XFFD2D2D2), fontSize: 18),
              ),
              Wrap(
                children: [
                  stock.price! > stock.lastPrice!
                      ? const Icon(
                          Icons.arrow_drop_up_rounded,
                          color: Colors.green,
                        )
                      : const Icon(Icons.arrow_drop_down_rounded, color: Colors.red),
                  Text((stock.price! > stock.lastPrice! ? '+' : '-') + '${stock.dayGain.toString()}%',
                      style: TextStyle(color: stock.price! > stock.lastPrice! ? Colors.green : Colors.red, fontSize: 18)),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Row cardDetailRow({required String title, required String info}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(color: Color(0XFFD2D2D2), fontSize: 18),
      ),
      Text(info, style: const TextStyle(color: Colors.white, fontSize: 18))
    ],
  );
}

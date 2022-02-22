import 'package:flutter/material.dart';
import 'package:validus_coin/model/stocks.dart';
import 'package:validus_coin/services/stocks_service.dart';
import 'package:validus_coin/widgets/stocks_card.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({Key? key}) : super(key: key);

  @override
  _StocksScreenState createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> with AutomaticKeepAliveClientMixin {
  List<Stock>? _stockList = [];
  bool _loading = false;
  bool _refreshIndicatorLoading = false;
  String? errorMessage;
  int? statusCode = 200;
  @override
  void initState() {
    super.initState();
    getStocks();
  }

  Future<void> getStocks() async {
    setState(() {
      _loading = true;
    });
    try {
      Stocks stocks = await StocksService().getStocks();
      _stockList = stocks.data;
      statusCode = stocks.statusCode;
    } catch (error) {
      errorMessage = 'Something Went Wrong!';
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('My WatchList'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _refreshIndicatorLoading = true;
            });
            await getStocks();
            setState(() {
              _refreshIndicatorLoading = false;
            });
          },
          child: _loading && !_refreshIndicatorLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : errorMessage != null
                  ? Center(
                      child: Text(errorMessage!),
                    )
                  : ListView.builder(
                      itemCount: _stockList!.length,
                      itemBuilder: (BuildContext context, int index) => _stockList!.isEmpty
                          ? const Center(
                              child: Text('No Data'),
                            )
                          : stocksCard(_stockList![index]),
                    ),
        ));
  }
}

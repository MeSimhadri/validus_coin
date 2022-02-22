import 'package:flutter/material.dart';
import 'package:validus_coin/gen/assets.gen.dart';
import 'package:validus_coin/screens/profile_screen.dart';
import 'package:validus_coin/screens/stocks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int _selectedPageIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [const StocksScreen(), const ProfileScreen()];
    pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Assets.svg.activeStocks.svg(),
              ),
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Assets.svg.stocks.svg(color: const Color(0XFFA2A2AE)),
              ),
              label: 'Stocks'),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Assets.svg.activeHome.svg(),
              ),
              icon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Assets.svg.home.svg(color: const Color(0XFFA2A2AE)),
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}

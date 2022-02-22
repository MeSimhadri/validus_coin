import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:validus_coin/gen/fonts.gen.dart';
import 'package:validus_coin/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

const _minPortraitAspectRatio = 9 / 22;
const _maxPortraitAspectRatio = 9 / 16;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validus Coin',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          cardColor: const Color(0XFF1E1E3D),
          fontFamily: FontFamily.founders,
          scaffoldBackgroundColor: const Color(0XFF171734),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Color(0XFFA2A2AE),
            selectedItemColor: Color(0XFFFFB802),
          ),
          appBarTheme: const AppBarTheme(
              toolbarHeight: 80,
              elevation: 0,
              color: Colors.transparent,
              titleTextStyle: TextStyle(fontFamily: FontFamily.airbnbCereal, fontSize: 36, fontWeight: FontWeight.w700)),
          primarySwatch: Colors.blue,
          primaryColor: const Color(0XFF171734)),
      builder: (context, widget) {
        final mq = MediaQuery.of(context);
        final aspectRatio = mq.size.width / mq.size.height;
        return ResponsiveWrapper.builder(
          widget,
          maxWidth: aspectRatio > _maxPortraitAspectRatio || aspectRatio < _minPortraitAspectRatio ? mq.size.height * 9 / 19 : null,
          background: Container(color: Colors.black),
        );
      },
      home: const HomeScreen(),
    );
  }
}

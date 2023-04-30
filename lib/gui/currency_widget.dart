import 'package:flutter/material.dart';

import '../global_settings.dart';
import '../main.dart';
import 'currency_page.dart';

class CurrencyWidget extends StatefulWidget {
  final int index;
  const CurrencyWidget({super.key, required this.index});

  @override
  State<CurrencyWidget> createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  @override
  Widget build(BuildContext context) {
    final String code = currencies[widget.index].toUpperCase();
    final dynamic date = api.currencyData[code].keys;
    final double midRate = api.currencyData[code][date.last]["mid"];
    final int len = date.length;
    final double todayRate =
        api.currencyData[code][date.elementAt(len - 1)]["mid"];
    final double yesterdayRate =
        api.currencyData[code][date.elementAt(len - 2)]["mid"];
    String change = ((todayRate / yesterdayRate) * 100 - 100).toString();
    Color iColor = colorMode[theme]["mainFontColor"];

    if (double.parse(change) > 0) {
      iColor = Colors.green;
      change = double.parse(change).toStringAsFixed(2);
      change = "+$change";
    } else if (double.parse(change) < 0) {
      iColor = Colors.red;
      change = double.parse(change).toStringAsFixed(2);
    }

    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return CurrencyPage(
              code: code.toLowerCase(), change: change, rate: todayRate, iColor: iColor, date: date.elementAt(len - 1));
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, _createRoute());
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorMode[theme]["mainThemeLight"],
                  colorMode[theme]["mainThemeGradient"],
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            left: 10,
            top: 15,
            child: Text(
              currencies[widget.index].toUpperCase(),
              style: TextStyle(
                color: colorMode[theme]["mainFontColor"],
                fontSize: 30,
                fontFamily: colorMode[theme]["mainFont"],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 50,
            child: Text(
              "PLN",
              style: TextStyle(
                color: colorMode[theme]["mainFontColor"],
                fontSize: 15,
                fontFamily: colorMode[theme]["mainFont"],
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 50,
            child: Text(
              change,
              style: TextStyle(
                color: iColor,
                fontSize: 20,
                fontFamily: colorMode[theme]["mainFont"],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 15,
            child: Text(
              midRate.toStringAsFixed(4),
              style: TextStyle(
                color: colorMode[theme]["mainFontColor"],
                fontSize: 30,
                fontFamily: colorMode[theme]["mainFont"],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

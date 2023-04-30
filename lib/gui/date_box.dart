import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../global_settings.dart';
import '../main.dart';

class DateBox extends StatefulWidget {
  const DateBox({super.key});

  @override
  State<DateBox> createState() => _DateBoxState();
}

class _DateBoxState extends State<DateBox> {
  bool _addVisible = false;
  @override
  Widget build(BuildContext context) {
    final String code = api.currencyData.keys.first;
    final dynamic date = api.currencyData[code].keys.last;
    final DateFormat inputFormat = DateFormat("yyyy-MM-dd");
    final DateFormat outputFormat = DateFormat("MMMM d");

    final String dateF = outputFormat.format(inputFormat.parse(date));
    final String finalD =
        lanM[lan][dateF.split(" ")[0]] + " " + dateF.split(" ")[1];

    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(top: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colorMode[theme]["mainThemeLight"], width: 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              ' $finalD',
              style: TextStyle(
                color: colorMode[theme]["mainFontColor"],
                fontFamily: colorMode[theme]["mainFont"],
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

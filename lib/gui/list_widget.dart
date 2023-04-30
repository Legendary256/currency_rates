import 'package:flutter/material.dart';

import '../global_settings.dart';
import '../main.dart';

class ListWidget extends StatefulWidget {
  final String code;
  const ListWidget({super.key, required this.code});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (_, index) {
          if (index < api.currencyData[widget.code].length) {
            final item = api.currencyData[widget.code].keys.elementAt(index);
            return Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: colorMode[theme]["mainThemeLight"], width: 2)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorMode[theme]["mainFontColor"], fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      api.currencyData[widget.code][item]['mid'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorMode[theme]["mainFontColor"], fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

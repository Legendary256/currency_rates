import 'package:flutter/material.dart';

import '../global_settings.dart';
import '../main.dart';
import 'currency_info.dart';

class CurrencyPage extends StatefulWidget {
  final String code;
  final double rate;
  final Color iColor;
  final String date;
  final String change;

  const CurrencyPage(
      {super.key,
      required this.code,
      required this.rate,
      required this.change,
      required this.iColor,
      required this.date});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textControllerPLN = TextEditingController();

  Widget textInput(String code, Function onChangedF,
      TextEditingController textController, double multiplier) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 * 0.9,
      child: TextField(
        controller: textController,
        onChanged: (value) => onChangedF(value, multiplier),
        decoration: InputDecoration(
          hintText: code.toUpperCase(),
          hintStyle: TextStyle(color:colorMode[theme]["mainFontColor"]),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMode[theme]["mainFontColor"]),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMode[theme]["mainFontColor"]),
          ),
        ),
        style: TextStyle(color: colorMode[theme]["mainFontColor"]),
      ),
    );
  }

  void _onTextChangedCode(String value, double multiplier) {
    if (value.isEmpty) {
      _textControllerPLN.clear();
    } else {
      double number = double.tryParse(value) ?? 0;
      double pln = number * multiplier;
      _textControllerPLN.text = pln.toStringAsFixed(4);
    }
  }

  void _onTextChangedPln(String value, double multiplier) {
    if (value.isEmpty) {
      _textController.clear();
    } else {
      double number = double.tryParse(value) ?? 0;
      double code = number / multiplier;
      _textController.text = code.toStringAsFixed(4);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _textControllerPLN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMode[theme]["mainBackground"],
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 66,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: colorMode[theme]["mainFontColor"], width: 0.5),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 5,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: colorMode[theme]["mainFontColor"]),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: 70,
              left: 10,
              child: Text(
                "${widget.code.toUpperCase()} - PLN",
                style: TextStyle(
                    color: colorMode[theme]["mainFontColor"],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: colorMode[theme]["mainFont"]),
              ),
            ),
            Positioned(
              top: 120,
              left: 10,
              child: Row(
                children: [
                  Text(
                    widget.rate.toString(),
                    style: TextStyle(
                        color: colorMode[theme]["mainFontColor"],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: colorMode[theme]["mainFont"]),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                      color: widget.iColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "${widget.change}%",
                        style: TextStyle(
                            color: colorMode[theme]["mainFontColor"],
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: colorMode[theme]["mainFont"]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 160,
              left: 10,
              child: Row(
                children: [
                  textInput(widget.code.toUpperCase(), _onTextChangedCode,
                      _textController, widget.rate),
                  const SizedBox(width: 30),
                  textInput(
                      "PLN", _onTextChangedPln, _textControllerPLN, widget.rate),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: CurrencyInfo(code: widget.code),
            )
          ],
        ),
      ),
    );
  }
}

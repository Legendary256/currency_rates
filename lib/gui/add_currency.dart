import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global_settings.dart';
import '../main.dart';

class AddCurrency extends StatefulWidget {
  Function changeState;

  AddCurrency({
    super.key,
    required this.changeState,
  });

  @override
  State<AddCurrency> createState() => _AddCurrencyState();
}

class _AddCurrencyState extends State<AddCurrency> {
  final TextEditingController _textController = TextEditingController();

  void _makeRequest(Uri url) async {
    final response = await http.get(url);

    if (response.statusCode != 200) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Check if the currency code is correct"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        currencies.add(_textController.text);
        api.parseData(jsonDecode(response.body));
        api.printData();
        widget.changeState();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 190,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10, bottom: 50, right: 20, left: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //mainThemeGradient,
              colorMode[theme]["mainThemeGradient"],
              //mainThemeLight,
              colorMode[theme]["mainThemeLight"],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lanM[lan]["add"],
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: colorMode[theme]["mainFontColor"]),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _textController,
                  autofocus: true,
                  style: TextStyle(color: colorMode[theme]["mainFontColor"]),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: lanM[lan]['type'],
                    labelStyle: TextStyle(color: colorMode[theme]["mainFontColor"]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          String code = _textController.text;
                          _makeRequest(api.getURL(code));
                        },
                        child: Text(
                          "add",
                          style: TextStyle(color: colorMode[theme]["mainFontColor"]),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.changeState();
                        },
                        child: Text(
                          "cancel",
                          style: TextStyle(color: colorMode[theme]["mainFontColor"]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

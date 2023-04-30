import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../global_settings.dart';
import 'loading_screen.dart';
import '../main.dart';
import 'main_page.dart';

class Boot extends StatefulWidget {
  const Boot({super.key});

  @override
  State<Boot> createState() => _BootState();
}

class _BootState extends State<Boot> {
  @override
  Widget build(BuildContext context) {
    List<Future<http.Response>> futuresList = [];
    for (String currency in currencies) {
      futuresList.add(http.get(api.getURL(currency)));
    }
    return FutureBuilder(
      future: Future.wait(futuresList),
      builder: (BuildContext context, AsyncSnapshot<List<http.Response>> snapshot) {
        if (snapshot.hasData) {
          for (http.Response response in snapshot.data!) {
            api.parseData(jsonDecode(response.body));
          }
          api.printData();
          return const MainPage();
        } else if (snapshot.hasError) {
          //return const InternetException();
          return const MainPage();
        } else {
          return const MainPage();
          //return const LoadingScreen();
        }
      },
    );
  }
}

import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'gui/main_page.dart';
import './data.dart';

class AskAPI {
  Map<String, dynamic> currencyData = {};
  //Map<String, dynamic> currencyData = data_no_internet;

  DateTime startDate = DateTime.now().subtract(const Duration(days: 31));
  DateTime endDate = DateTime.now();

  String code = "usd";
  String url = "";

  AskAPI() {
    setURL();
  }

  void setURL() {
    String start = this.startDate.toString().substring(0, 10);
    String end = this.endDate.toString().substring(0, 10);
    url =
        "https://api.nbp.pl/api/exchangerates/rates/C/$code/$start/$end/?format=json";
  }

  void setStart(DateTime startDate) => this.startDate = startDate;
  void setEnd(DateTime endDate) => this.endDate = endDate;

  Uri getURL(String code) {
    this.code = code;
    setURL();
    return Uri.parse(url);
  }

  void parseData(Map<String, dynamic> map) {
    String code = map["code"];
    for (int i = 0; i < map["rates"].length; i++) {
      String effectiveDate = map["rates"][i]["effectiveDate"];

      Map<String, dynamic> temp = {
        "bid": map["rates"][i]["bid"],
        "ask": map["rates"][i]["ask"],
        "mid": double.parse(
            ((map["rates"][i]["ask"] + map["rates"][i]["bid"]) / 2)
                .toStringAsFixed(4)),
      };

      if (!currencyData.containsKey(code)) {
        currencyData[code] = {};
      }

      currencyData[code][effectiveDate] = temp;
    }
  }

  List<PriceDate> getPrices(String code, String type) {
    List<PriceDate> prices = [];
    double i = 1;
    currencyData[code].forEach(
      (key, value) {
        //double d = double.parse(key.split('-')[1]);
        //prices.add(PriceDate(value[type], d));

        prices.add(PriceDate(value[type], i));
        i++;
      },
    );
    return prices;
  }

  void printData() {
    debugPrint("{");
    currencyData.forEach((key, value) {
      debugPrint("${key}:");
      value.forEach((key2, value) {
        debugPrint("${key2}: ${value},");
      });
      debugPrint("}");
    });
    debugPrint("}");
  }
}

class PriceDate {
  final double price;
  final double date;

  PriceDate(this.price, this.date);
}

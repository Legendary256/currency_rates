// Global settings for quick modificataion of appearance
// of the app.

import 'package:flutter/material.dart';

String theme = "dark";

Map<String, dynamic> colorMode = {
  "dark": {
    "mainTheme": Colors.white,
    "mainFontColor": Colors.white,
    "mainThemeLight": Colors.grey.shade900,
    "mainThemeGradient": Color.fromARGB(255, 70, 69, 69),
    "mainBackground": Colors.black,
  },
  "light": {
    "mainTheme": Colors.black,
    "mainFontColor": Colors.black,
    "mainThemeLight": Colors.grey.shade100,
    "mainThemeGradient": Color.fromARGB(255, 178, 175, 175),
    "mainBackground": Colors.white,
  }
};

//const Color mainTheme = Colors.white;
//const Color mainFontColor = Colors.white;

//Color mainThemeLight = Colors.grey.shade900;
//Color mainThemeGradient = Color.fromARGB(255, 70, 69, 69);
//Color mainBackground = Colors.black;
const String mainFont = "Proxima Nova";

List<String> currencies = [
  "usd",
  "eur",
  // 'gbp',
  // 'chf',
  // 'jpy',
  // 'czk',
  // 'huf',
  // 'aud',
  // 'cad',
  // 'nok',
  // 'sek'
];

String lan = "pl";

Map<String, dynamic> lanM = {
  "pl": {
    "January": "Styczeń",
    "February": "Luty",
    "March": "Marzec",
    "April": "Kwiecień",
    "May": "Maj",
    "June": "Czerwiec",
    "July": "Lipiec",
    "August": "Sierpień",
    "September": "Wrzesień",
    "October": "Październik",
    "November": "Listopad",
    "December": "Grudzień",
    "appbar": "Kursy walut",
    "add": "Dodaj walutę",
    "type": "Wpisz tutaj kod waluty",
    "current": "Język:",
    "style": "Styl:",
    "chart": "wykres",
    "list": "lista",
  },
  "en": {
    "appbar": "Currency rates",
    "January": "January",
    "February": "February",
    "March": "March",
    "April": "April",
    "May": "May",
    "June": "June",
    "July": "July",
    "August": "August",
    "September": "September",
    "October": "October",
    "November": "November",
    "December": "December",
    "add": "Add currency",
    "type": "Type currency code here",
    "current": "Language:",
    "style": "Theme:",
    "chart": "chart",
    "list": "list",
  },
};

MaterialColor primarySwatch = primarySwatchWhite;

const primarySwatchWhite = MaterialColor(
  0xFFFFFFFF, // 0xFFFFFFFF is white in hexadecimal
  <int, Color>{
    50: Color(0xFFFFFFFF), // white with 10% opacity
    100: Color(0xFFFFFFFF), // white with 20% opacity
    200: Color(0xFFFFFFFF), // white with 30% opacity
    300: Color(0xFFFFFFFF), // white with 40% opacity
    400: Color(0xFFFFFFFF), // white with 50% opacity
    500: Color(0xFFFFFFFF), // white with 60% opacity
    600: Color(0xFFFFFFFF), // white with 70% opacity
    700: Color(0xFFFFFFFF), // white with 80% opacity
    800: Color(0xFFFFFFFF), // white with 90% opacity
    900: Color(0xFFFFFFFF), // white with 100% opacity
  },
);

final myPrimarySwatchBlack = MaterialColor(
  0xFF000000, // 0xFF000000 is black in hexadecimal
  <int, Color>{
    50: Color(0xFFE0E0E0), // black with 10% opacity
    100: Color(0xFFB3B3B3), // black with 20% opacity
    200: Color(0xFF808080), // black with 30% opacity
    300: Color(0xFF4D4D4D), // black with 40% opacity
    400: Color(0xFF262626), // black with 50% opacity
    500: Color(0xFF000000), // black with 60% opacity
    600: Color(0xFF000000), // black with 70% opacity
    700: Color(0xFF000000), // black with 80% opacity
    800: Color(0xFF000000), // black with 90% opacity
    900: Color(0xFF000000), // black with 100% opacity
  },
);

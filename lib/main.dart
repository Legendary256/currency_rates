import 'package:flutter/material.dart';
import 'global_settings.dart';
import 'gui/boot.dart';
import 'api_requests.dart';

AskAPI api = AskAPI();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colorMode[theme]["mainTheme"],
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Boot(),
    );
  }
}

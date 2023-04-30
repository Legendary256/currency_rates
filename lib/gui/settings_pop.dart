import 'package:flutter/material.dart';

import '../global_settings.dart';

class SettingsPop extends StatefulWidget {
  const SettingsPop({super.key});

  @override
  State<SettingsPop> createState() => _SettingsPopState();
}

class _SettingsPopState extends State<SettingsPop> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10, bottom: 50, right: 20, left: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorMode[theme]["mainThemeGradient"],
              colorMode[theme]["mainThemeLight"],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lanM[lan]["current"],
                  style: TextStyle(
                      fontSize: 24, color: colorMode[theme]["mainFontColor"]),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: lan,
                  style: TextStyle(
                      color: colorMode[theme]["mainBackground"], fontSize: 24),
                  onChanged: (String? newValue) {
                    setState(() {
                      lan = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('🇬🇧'),
                    ),
                    DropdownMenuItem(
                      value: 'pl',
                      child: Text('🇵🇱'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lanM[lan]["style"],
                  style: TextStyle(
                      fontSize: 24, color: colorMode[theme]["mainFontColor"]),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: theme,
                  style: TextStyle(
                      color: colorMode[theme]["mainBackground"], fontSize: 24),
                  onChanged: (String? newValue) {
                    setState(() {
                      theme = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'dark',
                      child: Text('dark'),
                    ),
                    DropdownMenuItem(
                      value: 'light',
                      child: Text('light'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

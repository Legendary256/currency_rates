import 'package:flutter/material.dart';

import 'add_currency.dart';
import 'currency_widget.dart';
import 'date_box.dart';
import '../global_settings.dart';
import 'settings_pop.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _settingsVisible = false;
  bool _addVisible = false;

  @override
  Widget build(BuildContext context) {
    changeAddVisable() {
      setState(
        () {
          _addVisible = false;
        },
      );
    }
    return Scaffold(
      backgroundColor: colorMode[theme]["mainBackground"],
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 0.0,
        backgroundColor: colorMode[theme]["mainThemeLight"],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: Text(
          lanM[lan]["appbar"],
          style: TextStyle(
            color: colorMode[theme]["mainFontColor"],
            fontFamily: colorMode[theme]["mainFont"],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: colorMode[theme]["mainFontColor"]),
            onPressed: () {
              setState(
                () {
                  _addVisible = true;
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: colorMode[theme]["mainFontColor"]),
            onPressed: () {
              setState(
                () {
                  _settingsVisible = true;
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _settingsVisible = false;
                  _addVisible = false;
                },
              );
            },
            child: Column(
              children: [
                DateBox(),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      if (index < currencies.length) {
                        final item = currencies[index];
                        return Dismissible(
                          key: Key(item),
                          child: CurrencyWidget(index: index),
                          onDismissed: (direction) {
                            setState(
                              () {
                                currencies.removeAt(index);
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _settingsVisible,
            child: SettingsPop(),
          ),
          Visibility(
            visible: _addVisible,
            child: AddCurrency(changeState: changeAddVisable),
          ),
        ],
      ),
    );
  }
}

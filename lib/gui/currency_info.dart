import 'package:flutter/material.dart';

import '../global_settings.dart';
import '../main.dart';
import 'chart_widget.dart';
import 'list_widget.dart';

class CurrencyInfo extends StatefulWidget {
  final String code;
  const CurrencyInfo({super.key, required this.code});

  @override
  State<CurrencyInfo> createState() => _CurrencyInfoState();
}

class _CurrencyInfoState extends State<CurrencyInfo> {
  bool _isChartSelected = true;
  final double containerHeight = 25;
  final double sliderHeight = 25;

  void _toggleSelection() {
    setState(() {
      _isChartSelected = !_isChartSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorMode[theme]["mainThemeLight"],
            colorMode[theme]["mainThemeGradient"],
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            height: containerHeight,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: containerHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorMode[theme]["mainThemeGradient"],
                      borderRadius: BorderRadius.circular(containerHeight / 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _toggleSelection();
                            },
                            child: Text(
                              lanM[lan]['chart'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: colorMode[theme]["mainFontColor"],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _toggleSelection();
                            },
                            child: Text(
                              lanM[lan]['list'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: colorMode[theme]["mainFontColor"],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  top: containerHeight - sliderHeight,
                  left: _isChartSelected
                      ? 0
                      : MediaQuery.of(context).size.width / 2,
                  right: _isChartSelected
                      ? MediaQuery.of(context).size.width / 2
                      : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    height: sliderHeight,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: colorMode[theme]["mainFontColor"],
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(sliderHeight / 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isChartSelected
                ? ChartWidget(
                    points: api.getPrices(widget.code.toUpperCase(), "mid"),
                  )
                : ListWidget(code: widget.code.toUpperCase()),
          ),
        ],
      ),
    );
  }
}

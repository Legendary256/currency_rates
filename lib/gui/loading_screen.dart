import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../global_settings.dart';
import 'boot.dart';

final spinkit = SpinKitCircle(
  size: 100,
  itemBuilder: (BuildContext contex, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorMode[theme]["mainTheme"],
      ),
    );
  },
);

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget loadingScreen = Scaffold(
      backgroundColor: colorMode[theme]["mainBackground"],
      body: Center(
        child: spinkit,
      ),
    );
    return loadingScreen;
  }
}

class InternetException extends StatelessWidget {
  const InternetException({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No Internet Connection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please check your internet connection and try again",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const Boot(),
                        transitionDuration: const Duration(milliseconds: 50),
                      ),
                    );
                  },
                  child: const Text("Try Again"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';
import 'package:weather/screens/location_screen.dart';

void main() => runApp(Me());

class Me extends StatelessWidget {
  const Me({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic weatherData = LocationScreen().locationWeather;

    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
      //initialRoute: '/',
      // routes: {
      //   //'/': (context) => LoadingScreen(),
      //   'first': (context) => LocationScreen(
      //         locationWeather: weatherData,
      //       ),
      // },
    );
  }
}

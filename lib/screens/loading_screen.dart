import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    //  super.initState();
    //Location().getLocation();
    getLocationData();
    print('here init method called');
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    //print(weatherData);
    print('Weather Data Provider ? ');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
    //Navigator.pushNamed(context, 'first');
    //return weatherData;

    //var weatherDescription = weatherData['weather'][0]['description'];
    //print(weatherDescription);

    //print(decodeData);

    // print(Location().longitude);
    // print(Location().latitude);
  }

  // Future<void> getData() async {
  // http.Response response = await http.get(Uri.parse(url));
  // //print(response.body);
  // if (response.statusCode == 200) {
  //   String decodeData = response.body;
  //   var weatherDescription =
  //       jsonDecode(decodeData)['weather'][0]['description'];
  //   print(weatherDescription);
  //
  //   print(decodeData);
  // } else {
  //   print(response.statusCode);
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
    // //getData();
    // return Scaffold(
    //   body: SafeArea(
    //     child: Center(
    //
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.pushNamed(context, 'first');
    //               //getLocation();
    //               //getData();
    //               print(
    //                   'here is longitude: $longitude and here is latitude: $latitude');
    //             },
    //             child: const Text(
    //               'get the location',
    //               style: TextStyle(fontSize: 20.0),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  //void getLocation() {}
}

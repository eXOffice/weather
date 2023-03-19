import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;;

import 'package:weather/services/location.dart';

var url =
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=6ae5b8e29cf3d249e85a4d02e9a037c1';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

double? latitude, longitude;

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    //  super.initState();
    //Location().getLocation();
    getLocation();
    print('here init method called');
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    longitude = location.longitude;
    latitude = location.latitude;
    // print(longitude);
    // print(latitude);
    // print(Location().longitude);
    // print(Location().latitude);
  }

  Future<void> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    //print(response.body);
    if (response.statusCode == 200) {
      String decodeData = response.body;
      var weatherDescription =
          jsonDecode(decodeData)['weather'][0]['description'];
      print(weatherDescription);

      print(decodeData);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  //getLocation();
                  getData();
                  print(
                      'here is longitude: $longitude and here is latitude: $latitude');
                },
                child: const Text(
                  'get the location',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //void getLocation() {}
}

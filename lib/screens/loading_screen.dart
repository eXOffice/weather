import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  //getLocation();
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

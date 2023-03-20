import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';

import '../utilities/constants.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  String? weatherIcon;
  double? tempreture;
  int? ktempreture;
  String? getMessase;
  int? condition;
  String? cityName;
  String? weatherDescription;

  @override
  void initState() {
    //super.initState();
    updateUI(widget.locationWeather);
    // print(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          ktempreture = 0;
          weatherIcon = 'Error';
          getMessase = 'Unable to get Weather Data';
          cityName = '';
          return;
        }

        tempreture = weatherData['main']['temp'];
        ktempreture = tempreture?.toInt();
        getMessase = weather.getMessage(ktempreture!);

        condition = weatherData['weather'][0]['id'];
        cityName = weatherData['name'];
        weatherDescription = weatherData['weather'][0]['description'];
        weatherIcon = weather.getWeatherIcon(condition!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/location.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      print(typedName);
                      if (typedName != null) {
                        print('its ok with$typedName');
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        print('and its ok too');
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      ktempreture.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon!,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$getMessase in $cityName',
                  style: kMessageTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

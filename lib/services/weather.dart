import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

double? latitude = 0.2, longitude = 0.3;

const apiKey = '6ae5b8e29cf3d249e85a4d02e9a037c1';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    //get location from Location class
    Location location = Location();
    await location.getLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    // get weather data  from NetworkHelper class
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌩'; //'☀️'; //'🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

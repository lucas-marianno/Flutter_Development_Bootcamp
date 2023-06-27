import '../utilities/api_keys.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  late dynamic weatherData;

  getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double lat = location.latitude;
    double lon = location.longitude;

    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');

    weatherData = await network.getdata();
  }

  setLocation(double latitude, double longitude) async {
    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');

    weatherData = await network.getdata();
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
      return '🌫';
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

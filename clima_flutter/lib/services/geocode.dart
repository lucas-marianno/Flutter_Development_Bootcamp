import 'dart:ffi';

import '../utilities/api_keys.dart';
import 'networking.dart';

class Geocoding {
  bool hasData = false;
  List<City> cityList = [];

  late dynamic _geocodingData;

  fetchData(String cityName) async {
    cityName = cityName.replaceAll(' ', '_');
    const int limit = 5;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=$limit&appid=$apikey');

    try {
      _geocodingData = await networkHelper.getdata();

      for (var entry in _geocodingData) {
        cityList.add(
          City(
            name: entry['name'] ?? '',
            lat: entry['lat'] ?? 0,
            lon: entry['lon'] ?? 0,
            country: entry['country'] ?? '',
            state: entry['state'] ?? '',
          ),
        );
      }

      hasData = cityList.isNotEmpty;

      cityList.forEach((element) {
        print(element.toString());
      });
    } catch (e) {
      // print(e);
      _geocodingData = '$e';
    }
  }
}

List<City> mockCityList = [
  City.fromList(['São Bernardo', -3.3650267, -42.4224814, 'BR', 'Maranhão']),
  City.fromList(['São Bernardo', -6.3543979, -38.42879371659045, 'BR', 'Rio Grande do Norte']),
  City.fromList(['São Bernardo', -2.5627784, -44.2204232, 'BR', 'Maranhão']),
  City.fromList(['São Bernardo', -22.3539872, -42.4700537, 'BR', 'Rio de Janeiro']),
  City.fromList(['São Bernardo', -16.5790589, -49.3986541, 'BR', 'Goiás']),
];

class City {
  City({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String state;

  List toList() {
    return [name, lat, lon, country, state];
  }

  static City fromList(List list) {
    if (list[0] is! String) throw "${list[0].runtimeType} is not 'String'";
    if (list[1] is! Double) throw "${list[1].runtimeType} is not 'Double'";
    if (list[2] is! Double) throw "${list[2].runtimeType} is not 'Double'";
    if (list[3] is! String) throw "${list[3].runtimeType} is not 'String'";
    if (list[4] is! String) throw "${list[4].runtimeType} is not 'String'";
    return City(name: list[0], lat: list[1], lon: list[2], country: list[3], state: list[4]);
  }
}

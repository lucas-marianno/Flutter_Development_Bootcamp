import 'dart:convert';
import 'package:http/http.dart' as http;

const successfulRequest = 200;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getdata() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == successfulRequest) {
      return jsonDecode(response.body);
    } else {
      throw 'Problem fetching data! status code ${response.statusCode}';
    }
  }
}

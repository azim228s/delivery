import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal();

  String localHost = 'https://192.168.1.101:8000';

  Future<dynamic> fetchGetRequest() async {
    var url = Uri.parse('$localHost/clients/1/events');

    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.body.isEmpty) {
          return <Map<String, dynamic>>[];
        } else {
          return json.decode(response.body);
        }
      }
      String errorString =
          'fetchGetRequest: {url: $url, status: ${response.statusCode}, body: ${response.body}';
      throw Exception(errorString);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String, dynamic>?> fetchPostRequest(
    Map<String, dynamic> data,
  ) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$localHost/clients/1/events'),
        body: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.body.isEmpty) {
          return <String, dynamic>{};
        } else {
          return json.decode(response.body);
        }
      }

      String errorString =
          'fetchPostRequest: {url: ${Uri.parse("clients/1/events")}, status: ${response.statusCode}, body: ${response.body}, sendData: $data';

      throw Exception(errorString);
    } catch (e) {
      //ignore
    }
  }
}

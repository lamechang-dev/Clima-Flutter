import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';

const apiKey = 'c0f31b5ce9ca320f18128269cc0110e2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherDataByLocation();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactiveate called');
  }

  void getWeatherDataByLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    await getData();
  }

  Future<http.Response> getData() async {
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      double temperature = decodedData['main']['temp'];
      String cityName = decodedData['name'];
      int condition = decodedData['weather'][0]['id'];

      print(temperature);
      print(cityName);
      print(condition);

    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getWeatherDataByLocation();
    return Scaffold(
    );
  }
}

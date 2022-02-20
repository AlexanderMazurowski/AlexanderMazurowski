import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldWeather {

  late String temp;
  late String locationName;
  late String main;
  late String description;
  late String icon;
  late String wind;
  late String hum;
  late bool negativeTemp;

  late double lon;
  late double lat;

  String location;
  String lan;
  final String apiKey = "5ac9176f0dcbe4dcdfeaf0aaf68a9d8b";
  String apiKe = "";

  WorldWeather({required this.location, required this.lan});

  Future<void> getWeather() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&lang=$lan&appid=5ac9176f0dcbe4dcdfeaf0aaf68a9d8b&units=metric"));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map data = jsonDecode(response.body);

      double ftemp = data["main"]["temp"];

      temp = ftemp.toString().split(".")[0][0] == "-"?ftemp.toString().split(".")[0].split("-")[1]:ftemp.toString().split(".")[0];
      locationName = data["name"];
      main = data["weather"][0]["main"];
      description = data["weather"][0]["description"];
      icon = data["weather"][0]["icon"];
      lon = data["coord"]["lon"];
      lat = data["coord"]["lat"];
      wind = data["wind"]["speed"].toString().split(".")[0]+" km/h";
      hum = data["main"]["humidity"].toString()+" %";
      negativeTemp = ftemp.toString().split(".")[0][0] == "-"?true:false;


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load weather data');
    }
  }

}

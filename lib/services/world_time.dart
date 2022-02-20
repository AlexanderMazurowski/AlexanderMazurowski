import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime {
  late String time;
  String url;

  WorldTime({required this.url});

  Future<void> getTime() async {
    Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
    if(response.statusCode == 200){
      Map data = jsonDecode(response.body);

      //get the time from the data
      String datetime = data["datetime"];
      String offsetHours = data["utc_offset"].substring(0, 3);
      String offsetMins = data["utc_offset"].substring(0, 1) +
          data["utc_offset"].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHours), minutes: int.parse(offsetMins)));

      time = DateFormat.Hm().format(now);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load time data');
    }
  }
}
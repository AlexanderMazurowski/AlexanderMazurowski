import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime {
  late String time;
  String url;

  WorldTime({required this.url});

  Future<void> getTime() async {
    //Response response = await get(Uri.http("worldtimeapi.org","/api/timezone/$url"));
    Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
    if(response.statusCode == 200){
      Map data = jsonDecode(response.body);
      //print(data);

      //get the time from the data
      String datetime = data["datetime"];
      String offsetHours = data["utc_offset"].substring(0, 3);
      String offsetMins = data["utc_offset"].substring(0, 1) +
          data["utc_offset"].substring(4, 6);
      //print(datetime);
      //print(offsetMins);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHours), minutes: int.parse(offsetMins)));
      //print(now);

      time = DateFormat.Hm().format(now);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
/*
Future<void> test ()async{

Response response = await
get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));

Map data = jsonDecode(response.body);
}
*/
Future<void> getTime() async {
  Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/Europe/Vienna"));
  Map data = jsonDecode(response.body);
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wetter_app/services/settings.dart';
import 'package:wetter_app/services/world_summary.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldSummary> locations = [
    //Europe
    WorldSummary(location: "vienna", url: "Europe/Vienna", lan: lan, name: "Wien"),
    WorldSummary(location: "kottingbrunn", url: "Europe/Vienna", lan: lan, name: "Kottingbrunn"),
    WorldSummary(location: "warsaw", url: "Europe/Vienna", lan: lan, name: "Warschau"),
    WorldSummary(location: "munich", url: "Europe/Vienna", lan: lan, name: "München"),
    WorldSummary(location: "london", url: "Europe/London", lan: lan, name: "London"),
    WorldSummary(location: "madeira", url: "Atlantic/Madeira", lan: lan, name: "Madeira"),
    //USA
    WorldSummary(location: "new%20york", url: "America/New_York", lan: lan, name: "New York City"),
    WorldSummary(location: "miami", url: "America/New_York", lan: lan, name: "Miami"),
    WorldSummary(location: "cupertino", url: "America/Los_Angeles", lan: lan, name: "Cupertino"),
    WorldSummary(location: "mountain%20view", url: "America/Los_Angeles", lan: lan, name: "Mountain View"),
    WorldSummary(location: "honolulu", url: "Pacific/Honolulu", lan: lan, name: "Honolulu"),
    WorldSummary(location: "anchorage", url: "America/Anchorage", lan: lan, name: "Anchorage"),
    //South America
    WorldSummary(location: "rio%20de%20janeiro", url: "America/Sao_Paulo", lan: lan, name: "Rio de Janeiro"),
    //Africa
    WorldSummary(location: "cape%20town", url: "Africa/Johannesburg", lan: lan, name: "Kapstadt"),
    //Near East
    WorldSummary(location: "abu%20dhabi", url: "Asia/Dubai", lan: lan, name: "Abu Dhabi"),
    //Asia
    WorldSummary(location: "bangkok", url: "Asia/Bangkok", lan: lan, name: "Bangkok"),
    WorldSummary(location: "shanghai", url: "Asia/Shanghai", lan: lan, name: "Shanghai"),
    WorldSummary(location: "tokyo", url: "Asia/Tokyo", lan: lan, name: "Tokio"),
    //Siberia
    WorldSummary(location: "vladivostok", url: "Asia/Vladivostok", lan: lan, name: "Wladiwostok"),
    WorldSummary(location: "yakutsk", url: "Asia/Yakutsk", lan: lan, name: "Yakutsk"),
    WorldSummary(location: "magadan", url: "Asia/Magadan", lan: lan, name: "Magadan"),
    //Pacific
    WorldSummary(location: "alice%20springs", url: "Australia/Darwin", lan: lan, name: "Alice Springs"),
    //Antarctic
    WorldSummary(location: "mcmurdo%20station", url: "Pacific/Auckland", lan: lan, name: "McMurdo Station"),
  ];

  void updateTime(index) async {
    WorldSummary instance = locations[index];
    await instance.getWorldSummary();
    Navigator.pop(context, {
      "location": instance.locationName,
      "time": instance.time,
      "temp": instance.temp,
      "main": instance.main,
      "description": instance.description,
      "instance": instance,
      "lon": instance.lon,
      "lat": instance.lat,
      "wind": instance.wind,
      "hum": instance.hum,
      "icon": instance.icon,
      "dynamicGradient": instance.dynamicGradient,
      "dynamicColor": instance.dynamicColor,
      "dynamicBorderColor": instance.dynamicBorderColor,
      "negativeTemp": instance.negativeTemp,
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState function ran");
  }

  @override
  Widget build(BuildContext context) {
    print("build function ran");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3469B3),
        title: Text("Choose your location"),
        elevation: 0,

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/location-background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0.0,
                    color: Color(0xC11D1D),
                    child: Container(
                      decoration:  BoxDecoration(
                        color: Color(0x23FFFFFF),
                        borderRadius: BorderRadius.circular(16),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Color(0xB3FFFFFF),
                          width: 1,
                        ),
                      ),
                      child: ListTile(
                        tileColor: Color(0x00C11D1D),

                        onTap: () {
                          updateTime(index);
                        },
                        title: Text(locations[index].name,

                          style: TextStyle(
                            fontFamily: 'Overpass',
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
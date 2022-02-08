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
    WorldSummary(location: "vienna", url: "Europe/Vienna", lan: lan, name: "Wien"),
    WorldSummary(location: "london", url: "Europe/London", lan: lan, name: "London"),
    WorldSummary(location: "vladivostok", url: "Asia/Vladivostok", lan: lan, name: "Wladivostok"),
    WorldSummary(location: "yakutsk", url: "Asia/Yakutsk", lan: lan, name: "Jakutsk"),
    WorldSummary(location: "madeira", url: "Atlantic/Madeira", lan: lan, name: "Madeira"),
    WorldSummary(location: "magadan", url: "Asia/Magadan", lan: lan, name: "Magadan"),
    WorldSummary(location: "new%20york", url: "America/New_York", lan: lan, name: "New York City"),
    WorldSummary(location: "miami", url: "Etc/GMT+5", lan: lan, name: "Miami"),

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
    //final mapdata = ModalRoute.of(context).settings.arguments as Map;
    //print(mapdata);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C4C59),
        title: Text("Choose your location"),
        elevation: 0,

      ),
      //navigationBar: CupertinoNavigationBar(
      //backgroundColor: Colors.blue[900],
      //middle: Text("Hello World"),
      //centerTitle: true,
      //),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/location-background.png'),
            fit: BoxFit.cover,
          ),
        ),
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
                      tileColor: Color(0xC11D1D),

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
    );
  }
}
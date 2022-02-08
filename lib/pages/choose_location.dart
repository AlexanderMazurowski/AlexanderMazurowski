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
    WorldSummary(location: "vienna", url: "Europe/Vienna", lan: lan),
    WorldSummary(location: "st%20johns", url: "America/St_Johns", lan: lan),
    WorldSummary(location: "london", url: "Europe/London", lan: lan),
    WorldSummary(location: "vladivostok", url: "Asia/Vladivostok", lan: lan),
    WorldSummary(location: "yakutsk", url: "Asia/Yakutsk", lan: lan),
    WorldSummary(location: "madeira", url: "Atlantic/Madeira", lan: lan),
    WorldSummary(location: "magadan", url: "Asia/Magadan", lan: lan),
    WorldSummary(location: "new%20york", url: "America/New_York", lan: lan),
    WorldSummary(location: "miami", url: "Etc/GMT+5", lan: lan),
    WorldSummary(location: "norrkoeping", url: "Europe/Stockholm", lan: lan),
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
        backgroundColor: Color(0xFF47BFDF),
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
          gradient: LinearGradient(
            colors: [Color(0xFF47BFDF), Color(0xFF3474E0)],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
          shape: BoxShape.rectangle,
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
                      title: Text(locations[index].url,

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
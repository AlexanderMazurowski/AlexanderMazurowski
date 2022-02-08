import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wetter_app/services/settings.dart';
import 'package:wetter_app/services/world_summary.dart';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  Future<void> setupWorldSummary() async {
    if (data.isEmpty) {
      WorldSummary instance =
      WorldSummary(location: "vienna", url: "Europe/Vienna", lan: lan, name: "Wien");
      //WorldWeather wInstance =
      //WorldWeather(location: "location", flag: "flag", url: "url");
      await instance.getWorldSummary();

      //await wInstance.getWeather();
      //print(wInstance.fTemp);

      //timer = Timer.periodic(const Duration(seconds: 1), (Timer t) =>  instance.getTime());
      print("test1" + instance.time);

      //time = instance.time;

      data = {
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
        //"temp": instance.temp,
      };
      //running = false;
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic result;
    return Scaffold(
      body: FutureBuilder(
          future: setupWorldSummary(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: data["dynamicGradient"],
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(42, 64, 42, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: data["dynamicColor"],
                              size: 24,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            data["location"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Poppins',
                              color: data["dynamicColor"],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: data["dynamicColor"],
                              size: 24,
                            ),
                            onPressed: () async {
                              result = await Navigator.pushNamed(
                                context, "/location",/*arguments: {data["dynamicGradient"]}*/);
                              print(result);
                              setState(() {
                                data = result;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/weathericons/${data["icon"]}.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(42, 0, 42, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0x23FFFFFF),
                          borderRadius: BorderRadius.circular(16),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: data["dynamicBorderColor"],
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                data["time"],
                                style: GoogleFonts.getFont(
                                  'Overpass',
                                  color: data["dynamicColor"],
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '-',
                                    style: GoogleFonts.getFont(
                                      'Overpass',
                                      color: data["negativeTemp"]==true?data["dynamicColor"]:Color(0x303030),
                                      fontSize: 92,
                                    ),
                                  ),
                                  Text(
                                    data["temp"],
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Overpass',
                                      color: data["dynamicColor"],
                                      fontSize: 92,
                                    ),
                                  ),
                                  Text(
                                    '°',
                                    style: GoogleFonts.getFont(
                                      'Overpass',
                                      color: data["dynamicColor"],
                                      fontSize: 92,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                data["description"],
                                style: TextStyle(
                                  fontFamily: 'Overpass',
                                  color: data["dynamicColor"],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 16, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/Vector.svg',
                                      color: data["dynamicColor"],
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                                      child: Text(
                                        'Wind',
                                        style: TextStyle(
                                          fontFamily: 'Overpass',
                                          color: data["dynamicColor"],
                                        ),
                                      ),
                                    ),
                                    /*Text(
                                      '|',
                                      style: TextStyle(
                                        fontFamily: 'Overpass',
                                        color: data["dynamicColor"],
                                        fontSize: 16,
                                      ),
                                    ),*/
                                    Text(
                                      data["wind"],
                                      style: TextStyle(
                                        fontFamily: 'Overpass',
                                        color: data["dynamicColor"],
                                        fontSize: 16,
                                      ),
                                    ),
                                    /*Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/Vector (1).svg',
                                      color: data["dynamicColor"],
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                                      child: Text(
                                        'Hum',
                                        style: TextStyle(
                                          fontFamily: 'Overpass',
                                          color: data["dynamicColor"],
                                        ),
                                      ),
                                    ),
                                    /*Text(
                                      '|',
                                      style: TextStyle(
                                        fontFamily: 'Overpass',
                                        color: data["dynamicColor"],
                                        fontSize: 16,
                                      ),
                                    ),*/
                                    Text(
                                      data["hum"],
                                      style: TextStyle(
                                        fontFamily: 'Overpass',
                                        color: data["dynamicColor"],
                                        fontSize: 16,
                                      ),
                                    ),
                                    /*Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.white,
                      ),
                      label: Text(
                        'See ${data["location"]} on Google Maps',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Overpass',
                          color: Colors.black,
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        if (!await launch(
                            "https://www.google.com/maps/@${data["lat"]},${data["lon"]},12z"))
                          throw 'Could not launch';
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wetter_app/pages/home.dart';
import 'package:wetter_app/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(

    ),

    debugShowCheckedModeBanner: false,
    initialRoute: "/home",
    routes: {
      "/home": (context) => Home(),
      "/location": (context) => ChooseLocation(),
    },

  ));
}
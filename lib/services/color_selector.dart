import 'package:flutter/material.dart';

LinearGradient getGradient(id){
  if(id == "01d" || id == "02d" || id == "03d") {
    return const LinearGradient(
      colors: [Color(0xFF47BFDF), Color(0xFF3474E0)],
      stops: [0, 1],
      begin: AlignmentDirectional(0, -1),
      end: AlignmentDirectional(0, 1),
    );
  } else if(id == "01n"|| id == "02n"|| id == "03n"|| id == "04n" || id == "09n" || id == "10n" || id == "11n" || id == "13n" || id == "50n"){
    return const LinearGradient(
      colors: [Color(0xFF1C4C59), Color(0xFF000000)],
      stops: [0, 1],
      begin: AlignmentDirectional(0, -1),
      end: AlignmentDirectional(0, 1),
    );
  } else {
    return const LinearGradient(
      colors: [Color(0xFFF5F8FF), Color(0xFFB8BABF)],
      stops: [0.1, 1],
      begin: AlignmentDirectional(0, -1),
      end: AlignmentDirectional(0, 1),
    );
  }
}
Color getColor(id){
  if(id == "01d" || id == "02d" || id == "03d") {
    return const Color(0xFFFFFFFF);
  } else if(id == "01n" || id == "02n" || id == "03n" || id == "04n" || id == "09n" || id == "10n" || id == "11n" || id == "13n" || id == "50n"){
    return const Color(0xFFFFFFFF);
  } else {
    return const Color(0xFF000000);
  }
}

Color getBorderColor(id){
  if(id == "01d" || id == "02d" || id == "03d") {
    return const Color(0xB3FFFFFF);
  } else if(id == "01n"|| id == "02n"|| id == "03n"|| id == "04n" || id == "09n" || id == "10n" || id == "11n" || id == "13n" || id == "50n"){
    return const Color(0xB3FFFFFF);
  } else {
    return const Color(0xB3000000);
  }
}

//id == "01n"|| id == "02n"|| id == "03n"|| id == "04n" || id == "09n" || id == "10n" || id == "11n" || id == "13n" || id == "50n"
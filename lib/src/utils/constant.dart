import 'package:flutter/material.dart';

class MyColors {
  static const primary = Color(0xFF889FA5);
  static const secondary = Color(0xFFC6C6C6);
  static const text = Color(0xFFFFF5FF);
}
class MyConstant {
  // static const localBaseURL = 'http://192.168.242.239:3001/api/mobile/';
  // static const localBaseURL = 'http://e5af02260723.ngrok.io/api/mobile/';
  static const localBaseURL = 'https://api.openweathermap.org/data/2.5/weather?appid=92b5f550214dd4ab9ba1aff91d2f9f0e&units=metric&';
  
}
// https://api.openweathermap.org/data/2.5/weather?q=${cityVal}&units=metric&appid=92b5f550214dd4ab9ba1aff91d2f9f0e
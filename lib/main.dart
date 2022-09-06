import 'package:flutter/material.dart';
import 'package:whatsapp_clone/splash.dart';
import 'package:whatsapp_clone/welcome_page.dart';
void main() {
  runApp(MaterialApp(
      home: SplashScreen(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primaryColor: Colors.green, primaryColorDark: Colors.green, canvasColor: Colors.green, scaffoldBackgroundColor: Colors.white )));

}


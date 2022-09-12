import 'package:flutter/material.dart';
import 'package:whatsapp_clone/home/status.dart';
import 'package:whatsapp_clone/splash.dart';
import 'package:whatsapp_clone/welcome_page.dart';

import 'home_page.dart';
void main() {
  runApp(MaterialApp(
      home: HomeScreen(),
  debugShowCheckedModeBanner: false,

  theme: ThemeData(primaryColor: Colors.green, primaryColorDark: Colors.green, canvasColor: Colors.green, scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: new InputDecorationTheme(

          labelStyle: new TextStyle(color: Colors.green),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green)),

        focusedBorder: UnderlineInputBorder(

          borderSide: BorderSide(color: Colors.green),
          //  when the TextFormField in focused
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.green))));

}


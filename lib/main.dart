import 'package:flutter/material.dart';
import 'package:whatsapp_clone/home/camera.dart';
import 'package:whatsapp_clone/login_page.dart';

import 'home_page.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
// Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  firstCamera = cameras.first;

// Get a specific camera from the list of available cameras.
  runApp(MaterialApp(
      home: LoginScreen(),
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


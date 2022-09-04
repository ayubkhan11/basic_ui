import 'package:flutter/material.dart';
import 'package:whatsapp_clone/splash.dart';
import 'package:whatsapp_clone/welcome_page.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Future.delayed(Duration(seconds: 3), (){

      Navigator.of(context).push(
         MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()));
    });

    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(),
              Image.asset("assets/whatsappicons.png" ,  height: 100, width: 100),
              Column(
                children: [

                  const Text("from"),
                  Image.asset("assets/metalogo.png" ,  height: 50, width: 100,),
                  const SizedBox(height: 20)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

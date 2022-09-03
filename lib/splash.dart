import 'package:flutter/material.dart';



class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: SafeArea(
    child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(),
          Image.asset("assets/whatsappicons.png" ,  height: 100, width: 100),
          Column(
            children: [

              Text("from"),
              Image.asset("assets/metalogo.png" ,  height: 50, width: 100,),
              SizedBox(height: 20)
            ],
          ),

       ],
      ),
    ),
    )
    );
  }
}
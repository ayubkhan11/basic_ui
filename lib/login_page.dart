import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class LoginScreen extends StatefulWidget{
  @override
  State createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen>{
  final countryPicker = const FlCountryCodePicker();
  TextEditingController countrynameController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Material(
      child: SafeArea(
        child: Scaffold(
          body:
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  children:[
                    Container(
                    alignment:AlignmentDirectional.topEnd,
                    child:PopupMenuButton(icon: const Icon(Icons.more_vert,color: Colors.black), // add this line
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                              child: Container(
                                  child:const Text(
                                    "Report",)), value: 'report'),
                        ],onSelected: (index) async {
                          switch (index) {
                            case 'report':
                              break;
                          }
                        } ),
                  ),
                    Container(
                      alignment: AlignmentDirectional.topCenter,
                      child: const Text("Enter Your Phone Number", style: TextStyle(color: Colors.green, fontSize: 20)),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.symmetric(horizontal: 75,vertical: 10),
                      child:const Text("WhatApp will need to verify your phone number."
                          "what's my number?"),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                        child:TextField(
                          controller: countrynameController,
                          readOnly: true,
                          onTap: () async {
                            final code = await countryPicker.showPicker(context: context);

                            if(code != null){
                              setState(() {
                                countrynameController..text  = code.name;
                                countrycodeController..text  = code.dialCode;
                              });
                            }
                          },
                          decoration: InputDecoration(

                              labelText: 'Country'),
                        )
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: Row(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                            width: 70,
                            child:Flexible(child:   TextField(
                              readOnly: true,
                              controller: countrycodeController,
                            ),
                            )
                        ),
                        Expanded(child: Container()),
                        Flexible(child:TextField(
                          decoration: InputDecoration(
                            labelText: 'Phone',  ),
                        ),
                        ),

                      ],
                      ),
                    ),]
              ),
              Column(
                  children:[
                    SizedBox(
                      width: 100,
                      child: TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                        ),child: Text("NEXT"),),
                    )
                    ]
              )

            ],
          ),
        ),
      ),
    );
  }
}
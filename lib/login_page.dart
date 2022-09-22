import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home/Verification_page.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen>{
  final countryPicker = const FlCountryCodePicker();
  TextEditingController countrynameController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                            const PopupMenuItem<String>(
                                value: 'report',
                                child: Text(
                                  "Report",)),
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
                        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                        child:TextField(
                          controller: countrynameController,
                          readOnly: true,
                          onTap: () async {
                            final code = await countryPicker.showPicker(context: context);

                            if(code != null){
                              setState(() {
                                countrynameController.text  = code.name;
                                countrycodeController.text  = code.dialCode;
                              });
                            }
                          },
                          decoration: const InputDecoration(

                              labelText: 'Country'),
                        )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),

                      child: Row(children: [

                        SizedBox(
                          width: 70,
                          child: TextField(
                            readOnly: true,
                            controller: countrycodeController,
                            decoration: const InputDecoration(
                              labelText: '',  ),
                          ),
                        ),
                        Container(width: 20,),
                        Flexible(
                          child:TextField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone',  ),
                          ),
                        )

                      ],
                      ),
                    ),]
              ),
              Column(
                  children:[
                    SizedBox(
                      width: 100,
                      child: TextButton(
                        onPressed: ()async{
                          print('${countrycodeController.text}${phoneController.text}');
                          FirebaseAuth auth = FirebaseAuth.instance;
                          await auth.verifyPhoneNumber(
                            phoneNumber: '${countrycodeController.text}${phoneController.text}',
                            verificationCompleted: (PhoneAuthCredential credential) async {

                              await auth.signInWithCredential(credential);
                            },

                            codeAutoRetrievalTimeout: (String verificationId) {

                            },

                            verificationFailed: (FirebaseAuthException error) {

                            },

                            codeSent: (String verificationId, int? forceResendingToken) {
                              final snackBar = SnackBar(
                                content: const Text('OTP SEND!'),
                                action: SnackBarAction(
                                  label: 'X',
                                  onPressed: () {// Some code to undo the change.
                                  },),);ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>   VerficationScreen()),
                          );
                        } ,
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                        ),child: const Text("NEXT"),),
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
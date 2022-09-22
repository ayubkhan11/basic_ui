import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:whatsapp_clone/login_page.dart';

const Color primaryColor = Color(0xFF121212);
const Color accentPurpleColor = Color(0xFF6A53A1);
const Color accentPinkColor = Color(0xFFF99BBD);
const Color accentDarkGreenColor = Color(0xFF115C49);
const Color accentYellowColor = Color(0xFFFFB612);
const Color accentOrangeColor = Color(0xFFEA7A3B);

class VerficationScreen extends StatefulWidget {
  @override
  _VerficationScreenState createState() => _VerficationScreenState();
}

class _VerficationScreenState extends State<VerficationScreen> {
  late List<TextStyle?> otpTextStyles;
  late List<TextEditingController?> controls;
  int numberOfFields = 6;
  bool clearText = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("verifying your Number"),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.blueGrey,))],
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Waiting to automatically detect an SMS send to",
            style: TextStyle(fontSize: 15),
            ),
            Text("${countrycodeController.text}${phoneController.text}"),
            Spacer(flex: 2),
            OtpTextField(
              numberOfFields: numberOfFields,
              borderColor: Color(0xFF512DA8),
              focusedBorderColor: primaryColor,
              clearText: clearText,
              showFieldAsBox: true,
              textStyle: theme.textTheme.subtitle1,
              onCodeChanged: (String value) {
                //Handle each value
              },
              handleControllers: (controllers) {
                //get all textFields controller, if needed
                controls = controllers;
              },
              onSubmit: (String verificationCode) {
                //set clear text to clear text from all fields
                setState(() {
                  clearText = true;
                });
                //navigate to different screen code goes here
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  },
                );
              }, // end onSubmit
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "This helps us verify every user in our market place",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText1,
                ),
              ),
            ),
            Center(
              child: Text(
                "Didn't get code?",
                style: theme.textTheme.subtitle1,
              ),
            ),
            Spacer(flex: 3),
            CustomButton(
              onPressed: () {},
              title: "Confirm",
              color: primaryColor,
              textStyle: theme.textTheme.subtitle1?.copyWith(
                color: Colors.white,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class VerificationScreen2 extends StatefulWidget {
  @override
  _VerificationScreen2State createState() => _VerificationScreen2State();
}

class _VerificationScreen2State extends State<VerificationScreen2> {
  late List<TextStyle?> otpTextStyles;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    otpTextStyles = [
      createStyle(accentPurpleColor),
      createStyle(accentYellowColor),
      createStyle(accentDarkGreenColor),
      createStyle(accentOrangeColor),
      createStyle(accentPinkColor),
      createStyle(accentPurpleColor),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verification Code",
              style: theme.textTheme.headline4,
            ),
            SizedBox(height: 16),
            Text(
              "We texted you a code",
              style: theme.textTheme.headline6,
            ),
            Text("Please enter it below", style: theme.textTheme.headline6),
            Spacer(flex: 2),
            OtpTextField(
              numberOfFields: 6,
              borderColor: accentPurpleColor,
              focusedBorderColor: accentPurpleColor,
              styles: otpTextStyles,
              showFieldAsBox: false,
              borderWidth: 4.0,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "This helps us verify every user in our market place",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText1,
                ),
              ),
            ),
            Center(
              child: Text(
                "Didn't get code?",
                style: theme.textTheme.subtitle1,
              ),
            ),
            Spacer(flex: 3),
            CustomButton(
              onPressed: () {},
              title: "Confirm",
              color: primaryColor,
              textStyle: theme.textTheme.subtitle1?.copyWith(
                color: Colors.white,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.headline3?.copyWith(color: color);
  }
}

// class Test extends StatelessWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             const SizedBox(height: 150),
//             // This my custom widget
//             const Text("Test Otp"),
//             const SizedBox(height: 20),
//             Container(
//               decoration: const BoxDecoration(color: Colors.transparent),
//               height: 100,
//               child: OtpTextField(
//                 fieldWidth: 60,
//                 borderWidth: 5,
//                 keyboardType: TextInputType.number,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 numberOfFields: 4,
//                 borderRadius: BorderRadius.circular(15),
//                 focusedBorderColor: primaryColor,
//                 styles: [
//                   createStyle(context, Colors.black),
//                   createStyle(context, Colors.black),
//                   createStyle(context, Colors.black),
//                   createStyle(context, Colors.black),
//                 ],
//                 autoFocus: true,
//                 //set to true to show as box or false to show as dash
//                 showFieldAsBox: true,
//                 //runs when a code is typed in
//                 onCodeChanged: (String code) {
//                   //handle validation or checks here
//                 },
//                 //runs when every textfield is filled
//                 onSubmit: (String verificationCode) {
//                   showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Verification Code"),
//                           content: Text('Code entered is $verificationCode'),
//                         );
//                       });
//                 }, // end onSubmit
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   TextStyle? createStyle(BuildContext context, Color color) {
//     return Theme.of(context).textTheme.headline2!.copyWith(color: color);
//   }
// }

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    this.onPressed,
    this.height = 60,
    this.elevation = 1,
    this.color = primaryColor,
    this.textStyle,
  });

  final VoidCallback? onPressed;
  final double height;
  final double elevation;
  final String title;
  final Color color;

  // final BorderSide borderSide;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(30.0),
          bottomLeft: const Radius.circular(30.0),
        ),
      ),
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: textStyle,
          )
        ],
      ),
    );
  }
}
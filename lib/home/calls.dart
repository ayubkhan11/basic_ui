import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CallScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CallScreenState();
  }
}


class _CallScreenState extends State<CallScreen>{

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index){
                return ListTile(
                  leading: Container(
                    child:CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/arc.jpg"),
                    ),
                  ),
                  title: Text("Contact", style: TextStyle(fontSize: 15,),),
                  subtitle: Text( DateFormat("hh:mm").format(DateTime.now())),
                  trailing: Icon(Icons.call),

                );
              }),
        ],
      ),
    );
  }
}

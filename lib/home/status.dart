import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class StatusScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StatusScreenState();
  }
}


class _StatusScreenState extends State<StatusScreen>{

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          ListTile(
            leading: Container(
      child:CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage("assets/arc.jpg"),
      ),
    ),
            title: Text("My Status", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
            subtitle: Text("Tap to Add Status",style: TextStyle(color: Colors.grey),),
            trailing: Text( DateFormat("hh:mm").format(DateTime.now())),
          ),
          Container(
            height: 25,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(5) ,
            child: Text("Recent updates", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          ),
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

          );
           }),
          Container(height: 25,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(5) ,
            child: Text("Viewed updates", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),),
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

                );
              }),
          Container(height: 25,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(5) ,
            child: Text("Muted updates", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),),
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
                  title: Text("Contact", style: TextStyle(fontSize: 15, ),),
                  subtitle: Text( DateFormat("hh:mm").format(DateTime.now())),

                );
              }),

        ],
      ),
    );
  }
}

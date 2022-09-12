import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }
}


class _ChatScreenState extends State<ChatScreen>{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
        itemBuilder: (contex,index){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Row(
          children: [
           // Image.asset("assets/arc.jpg", width: MediaQuery.of(context).size.width*0.2,fit: BoxFit.cover),
           Container(
             height: 30,
             width: 30,
             child: CircleAvatar(
               radius: 30,
               backgroundImage: AssetImage("assets/arc.jpg"),
             )
           ),
            Container(
           width: MediaQuery.of(context).size.width*0.8-20,
             padding: EdgeInsets.all(10),
             
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               mainAxisSize: MainAxisSize.max,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                     Text("Message",style: TextStyle(color: Colors.grey),),
                   ],
                 ),
               Text(DateTime.now().toString()),
               ],
             ),
           )
          ],
        ),
      );
    });
  }

}
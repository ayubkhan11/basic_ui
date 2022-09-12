import 'package:flutter/material.dart';
import 'package:whatsapp_clone/home/chats.dart';
import 'package:whatsapp_clone/home/status.dart';

class HomeScreen extends StatefulWidget{
 @override
 State createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen>{
 @override
 Widget build(BuildContext context){
  return DefaultTabController(
  length: 4,
   child: SafeArea(
   child: Scaffold(
    backgroundColor:Colors.white,
    appBar: AppBar(
     backgroundColor: Colors.green,
     title: Text("WhatsApp Clone", style: TextStyle(color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.bold),),
     centerTitle: false,
     actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.blueGrey,)),
      IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.blueGrey,))
     ],
     bottom: const TabBar(
      indicatorColor: Colors.green,
      unselectedLabelColor: Colors.black,
      indicatorWeight: 5,

      tabs: [
      Tab(icon: Icon(Icons.camera_alt),),
      Tab(text:"CHATS"),
      Tab(text:"STATUS"),
      Tab(text:"CALLS"),
     ],),

    ),
    body: TabBarView(
     children: [
      Center(
          child: Text(
           'CAMERA',
           style: TextStyle(fontSize: 32),
          )),
     ChatScreen(),
      StatusScreen(),
      Center(
          child: Text(
           'CALLS',
           style: TextStyle(fontSize: 32),
          )),
     ],
    ),
   ),

  ),
 );
 }
 }
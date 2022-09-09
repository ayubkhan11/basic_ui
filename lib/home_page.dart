import 'package:flutter/material.dart';

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
     backgroundColor: Colors.black,
     title: Text("WhatsApp Clone", style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),),
     centerTitle: false,
     actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.green,)),
      IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.green,))
     ],
     bottom: const TabBar(
      indicatorColor: Colors.green,
      unselectedLabelColor: Colors.green,
      indicatorWeight: 5,

      tabs: [
      Tab(text:"CAMERA"),
      Tab(text:"CHATS"),
      Tab(text:"STATUS"),
      Tab(text:"CALLS"),
     ],)
    ),
    body: Column(),
   ),

  ),
 );
 }
 }
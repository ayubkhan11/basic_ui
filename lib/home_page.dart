import 'package:flutter/material.dart';
import 'package:whatsapp_clone/home/calls.dart';
import 'package:whatsapp_clone/home/camera.dart';
import 'package:whatsapp_clone/home/chats.dart';
import 'package:whatsapp_clone/home/contacts.dart';
import 'package:whatsapp_clone/home/status.dart';

import 'home/contacts/contacts_list_page.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

 @override
 _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
 final List<Tab> myTabs = <Tab>[
  new Tab(text: 'Camera'),
  new Tab(text: 'Chats'),
  new Tab(text: 'Status'),
  new Tab(text: 'Calls'),
 ];

 final List<Widget> redirectTabs = [
  CameraScreen(camera: firstCamera),
  ChatScreen(),
  StatusScreen(),
  CallScreen()
 ];
 TabController? _tabController;

 @override
 void initState() {
  super.initState();
  _tabController = new TabController(vsync: this, length: myTabs.length);
 }

 @override
 void dispose() {
  _tabController!.dispose();
  super.dispose();
 }

 @override
 Widget build(BuildContext context) {

  return new Scaffold(
   appBar: new AppBar(
    backgroundColor: Colors.green,
    title: Text("WhatsApp Clone", style: TextStyle(color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.bold),),
    actions: [
       IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.blueGrey,)),
       IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.blueGrey,))
      ],
    bottom: new TabBar(
     indicatorColor: Colors.green,
     unselectedLabelColor: Colors.black,
     indicatorWeight: 5,
     controller: _tabController,
     tabs: myTabs,
     onTap: (index){
      setState(() {

      });
     },
    ),
   ),

   body: new TabBarView(

    controller: _tabController,

    children: redirectTabs,
   ),
   floatingActionButton: (_tabController!.index == 0 || _tabController!.index == 3) ? null:  FloatingActionButton(
    onPressed: () {
     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ContactListPage()));
    }, // Switch tabs
    child: new Icon((_tabController!.index == 1)? Icons.message : Icons.add_call),
   ),
  );
 }
}
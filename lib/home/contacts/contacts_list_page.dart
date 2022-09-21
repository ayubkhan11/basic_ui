import 'package:flutter/material.dart';
import '../contacts.dart';
import 'package:contacts_service/contacts_service.dart';
class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  ContactListPageState createState() => ContactListPageState();
}

class ContactListPageState extends State<ContactListPage> {
  List<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
    refreshContacts();

  }

  Future<void> refreshContacts() async {
    var contacts = (await ContactsService.getContacts(
        withThumbnails: false, iOSLocalizedLabels: iOSLocalizedLabels));
    setState(() {
      _contacts = contacts;
    });

    for (final contact in contacts) {
      ContactsService.getAvatar(contact).then((avatar) {
        if (avatar == null) return;
        setState(() => contact.avatar = avatar);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              tileColor: Colors.green,
              leading: Icon(Icons.group, color: Colors.white,),
              title:  Text("New Group", style: TextStyle(color: Colors.white),),
            ),
            const ListTile(
              tileColor: Colors.green,
              leading: Icon(Icons.person_add,color: Colors.white,),
              title: Text("Add New Contact", style: TextStyle(color: Colors.white),),
            ),
            Container(child: _contacts != null
                ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _contacts!.length,
              itemBuilder: (BuildContext context, int index) {
                Contact c = _contacts!.elementAt(index);

                return ListTile(
                  onTap: () {

                  },
                  leading: (c.avatar != null && c.avatar!.isNotEmpty)
                      ? CircleAvatar(backgroundImage: MemoryImage(c.avatar!))
                      : CircleAvatar(child: Text(c.initials())),
                  title: Text(c.displayName ?? ""),
                );
              },
            )
                : TextButton(onPressed: (){},
                child:const Text("New Group"))
            ),
          ],
        ),
      )
    );
  }
}

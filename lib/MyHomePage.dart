import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contactList = [
    Contact("Shafi", "shafi@gmail.com", "343434343456789"),
    Contact("Shadi", "sadi@gmail.com", "9834434341"),
    Contact("Nadira", "nadira@gmail.com", "9335434445"),
  ];

  contactBottomSheet(index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Contact Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Text("Name: ${contactList[index].name}"),
              const SizedBox(height: 5),
              Text("Email: ${contactList[index].emailAddress}"),
              const SizedBox(height: 5),
              Text("Phone Number: ${contactList[index].phoneNumber}")
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contactList[index].name),
            onTap: () {
              contactBottomSheet(index);
            },
          );
        },
      ),
    );
  }
}

class Contact {
  String name;
  String emailAddress;
  String phoneNumber;

  Contact(this.name, this.emailAddress, this.phoneNumber);
}

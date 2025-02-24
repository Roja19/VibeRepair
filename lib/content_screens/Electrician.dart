import 'package:flutter/material.dart';
import 'package:VibeRepair/Content_Details/content_electrician.dart';

class Electrician extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Senthil",
      "subtitle": "2KM away",
      "image": "assets/images/user1.png",
      "price": "\₹90/hour",
      "phone": "+91 9123456789"
    },
    {
      "title": "Murugan",
      "subtitle": "3KM away",
      "image": "assets/images/user2.png",
      "price": "\₹85/hour",
      "phone": "+91 9234567890"
    },
    {
      "title": "Ramu",
      "subtitle": "4KM away",
      "image": "assets/images/user3.png",
      "price": "\₹92/hour",
      "phone": "+91 9345678901"
    },
    {
      "title": "Ganesh",
      "subtitle": "5KM away",
      "image": "assets/images/user4.png",
      "price": "\₹88/hour",
      "phone": "+91 9456789012"
    },
    {
      "title": "Arun",
      "subtitle": "6KM away",
      "image": "assets/images/user5.png",
      "price": "\₹95/hour",
      "phone": "+91 9567890123"
    },
    {
      "title": "Vinoth",
      "subtitle": "7KM away",
      "image": "assets/images/user6.png",
      "price": "\₹98/hour",
      "phone": "+91 9678901234"
    },
    {
      "title": "Manikandan",
      "subtitle": "8KM away",
      "image": "assets/images/user7.png",
      "price": "\₹100/hour",
      "phone": "+91 9789012345"
    },
    {
      "title": "Siva",
      "subtitle": "9KM away",
      "image": "assets/images/user8.png",
      "price": "\₹105/hour",
      "phone": "+91 9890123456"
    },
    {
      "title": "Mohan",
      "subtitle": "10KM away",
      "image": "assets/images/user9.png",
      "price": "\₹97/hour",
      "phone": "+91 9901234567"
    },
    {
      "title": "Krishna",
      "subtitle": "12KM away",
      "image": "assets/images/user10.png",
      "price": "\₹99/hour",
      "phone": "+91 9012345678"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electricians"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.red.shade200],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(items[index]["image"]),
                ),
                title: Text(
                  items[index]["title"],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  items[index]["subtitle"],
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => content_electrician(item: items[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

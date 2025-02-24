import 'package:flutter/material.dart';
import 'package:VibeRepair/Content_Details/content_mechanic.dart';

class Mechanic extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Vishal",
      "subtitle": "2KM away",
      "image": "assets/images/user1.png",
      "price": "\₹85/hour",
      "phone": "+91 9890123456"
    },
    {
      "title": "Praksah",
      "subtitle": "3KM away",
      "image": "assets/images/user2.png",
      "price": "\₹88/hour",
      "phone": "+91 7999888777"
    },
    {
      "title": "Kumaran",
      "subtitle": "3KM away",
      "image": "assets/images/user6.png",
      "price": "\₹82/hour",
      "phone": "+91 6888777666"
    },
    {
      "title": "Raja",
      "subtitle": "4KM away",
      "image": "assets/images/user3.png",
      "price": "\₹90/hour",
      "phone": "+91 5999666555"
    },
    {
      "title": "Vettri",
      "subtitle": "6KM away",
      "image": "assets/images/user4.png",
      "price": "\₹90/hour",
      "phone": "+91 4888555444"
    },
    {
      "title": "Sri Prakash",
      "subtitle": "6KM away",
      "image": "assets/images/user5.png",
      "price": "\₹86/hour",
      "phone": "+91 3777444333"
    },
    {
      "title": "Elavarasan",
      "subtitle": "7KM away",
      "image": "assets/images/user7.png",
      "price": "\₹89/hour",
      "phone": "+91 9234678910"
    },
    {
      "title": "Vijay Kumar",
      "subtitle": "9KM away",
      "image": "assets/images/user8.png",
      "price": "\₹84/hour",
      "phone": "+91 8547213690"
    },
    {
      "title": "Surya",
      "subtitle": "10KM away",
      "image": "assets/images/user9.png",
      "price": "\₹90/hour",
      "phone": "+91 7658904321"
    },
    {
      "title": "Alaguraja",
      "subtitle": "10KM away",
      "image": "assets/images/user10.png",
      "price": "\₹99/hour",
      "phone": "+91 9988123476"
    },
    {
      "title": "Manikandan",
      "subtitle": "12KM away",
      "image": "assets/images/user20.png",
      "price": "\₹96/hour",
      "phone": "+91 8877665544"
    },
    {
      "title": "Anbu",
      "subtitle": "13KM away",
      "image": "assets/images/user16.png",
      "price": "\₹98/hour",
      "phone": "+91 9123456780"
    },
    {
      "title": "Ravi Raj",
      "subtitle": "14KM away",
      "image": "assets/images/user17.png",
      "price": "\₹97/hour",
      "phone": "+91 8901234567"
    },
    {
      "title": "Preethan",
      "subtitle": "15KM away",
      "image": "assets/images/user18.png",
      "price": "\₹96/hour",
      "phone": "+91 9786543210"
    },
    {
      "title": "Manickam Lawrence",
      "subtitle": "15KM away",
      "image": "assets/images/user19.png",
      "price": "\₹100/hour",
      "phone": "+91 9012345678"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mechanic"),
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
                      builder: (context) => content_mechanic(item: items[index]),
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
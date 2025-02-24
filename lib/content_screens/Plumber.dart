import 'package:flutter/material.dart';
import 'package:VibeRepair/Content_Details/content_plumber.dart';

class Plumber extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Koushik",
      "subtitle": "2KM away",
      "image": "assets/images/user1.png",
      "price": "\₹80/hour",
      "phone": "+91 9097665433"
    },
    {
      "title": "Babu",
      "subtitle": "3KM away",
      "image": "assets/images/user2.png",
      "price": "\₹85/hour",
      "phone": "+91 9876543210"
    },
    {
      "title": "Anand",
      "subtitle": "3KM away",
      "image": "assets/images/user6.png",
      "price": "\₹85/hour",
      "phone": "+91 8765432109"
    },
    {
      "title": "Kathiravan",
      "subtitle": "4KM away",
      "image": "assets/images/user3.png",
      "price": "\₹86/hour",
      "phone": "+91 9988776655"
    },
    {
      "title": "Ravi",
      "subtitle": "6KM away",
      "image": "assets/images/user4.png",
      "price": "\₹92/hour",
      "phone": "+91 8899001122"
    },
    {
      "title": "Viswa",
      "subtitle": "6KM away",
      "image": "assets/images/user5.png",
      "price": "\₹98/hour",
      "phone": "+91 7654321098"
    },
    {
      "title": "Prakash",
      "subtitle": "7KM away",
      "image": "assets/images/user7.png",
      "price": "\₹98/hour",
      "phone": "+91 9900112233"
    },
    {
      "title": "Maaran",
      "subtitle": "9KM away",
      "image": "assets/images/user8.png",
      "price": "\₹93/hour",
      "phone": "+91 8123456789"
    },
    {
      "title": "Kathir",
      "subtitle": "10KM away",
      "image": "assets/images/user9.png",
      "price": "\₹97/hour",
      "phone": "+91 9234567890"
    },
    {
      "title": "Jeevan",
      "subtitle": "10KM away",
      "image": "assets/images/user10.png",
      "price": "\₹99/hour",
      "phone": "+91 8012345678"
    },
    {
      "title": "Mari Selva",
      "subtitle": "12KM away",
      "image": "assets/images/user11.png",
      "price": "\₹91/hour",
      "phone": "+91 9345678901"
    },
    {
      "title": "Vijay",
      "subtitle": "13KM away",
      "image": "assets/images/user12.png",
      "price": "\₹97/hour",
      "phone": "+91 9456789012"
    },
    {
      "title": "Rahul",
      "subtitle": "14KM away",
      "image": "assets/images/user13.png",
      "price": "\₹94/hour",
      "phone": "+91 9567890123"
    },
    {
      "title": "Arjun",
      "subtitle": "15KM away",
      "image": "assets/images/user14.png",
      "price": "\₹96/hour",
      "phone": "+91 9678901234"
    },
    {
      "title": "Amal Raj",
      "subtitle": "15KM away",
      "image": "assets/images/user15.png",
      "price": "\₹100/hour",
      "phone": "+91 9789012345"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plumbers"),
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
                      builder: (context) => content_plumber(item: items[index]),
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
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class content_electrician extends StatefulWidget {
  final Map<String, dynamic> item;

  const content_electrician({required this.item});

  @override
  State<content_electrician> createState() => _content_electricianState();
}

class _content_electricianState extends State<content_electrician> {
  double _rating = 3.0;

  @override
  void initState() {
    super.initState();
    _calculateAverageRating();
  }

  // Save user rating to Firestore
  Future<void> _saveRating(double rating) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    CollectionReference ratingsCollection = FirebaseFirestore.instance.collection('ratings');

    await ratingsCollection.doc(widget.item["title"]).collection("user_ratings").doc(user.email).set({
      'rating': rating,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Update the average rating after saving
    _calculateAverageRating();
  }

  // Calculate average rating from Firestore
  Future<void> _calculateAverageRating() async {
    CollectionReference ratingsCollection = FirebaseFirestore.instance.collection('ratings');

    QuerySnapshot userRatings = await ratingsCollection.doc(widget.item["title"]).collection("user_ratings").get();

    double totalRating = 0;
    int count = userRatings.docs.length;

    if (count > 0) {
      for (var doc in userRatings.docs) {
        totalRating += doc['rating'];
      }
      setState(() {
        _rating = totalRating / count; // Calculate average rating
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.item["title"]),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(widget.item["image"]),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.item["title"],
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              widget.item["subtitle"],
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1, color: Colors.grey),
            SizedBox(height: 10),

            // Pricing Section
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(widget.item["price"], style: TextStyle(fontSize: 18, color: Colors.red)),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Phone Number Section
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    widget.item["phone"],
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                _saveRating(rating); // Save rating to Firestore
              },
            ),
            SizedBox(height: 10),
            Text(
              "Ratings: ${_rating.toStringAsFixed(1)} ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),

            // Call Button
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Calling ${widget.item["phone"]}...")),
                );
              },
              icon: Icon(Icons.phone, color: Colors.white),
              label: Text("Call Electrician"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

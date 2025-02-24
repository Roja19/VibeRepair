import 'package:VibeRepair/content_screens/Electrician.dart';
import 'package:VibeRepair/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/login_page.dart';
import 'auth/register_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'content_screens/Mechanic.dart';
import 'content_screens/Plumber.dart';
import 'home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init(); // Initialize SharedPreferences
  await Firebase.initializeApp(); // Add this line
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => home(),
        '/plumber': (context) => Plumber(),
        '/mechanic': (context) => Mechanic(),
        '/electrician': (context) => Electrician(),

      },
    );
  }
}

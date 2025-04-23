import 'package:flutter/material.dart';
import 'pengaturan.dart';
import 'home.dart';
import 'tamu.dart';
import 'rsvp.dart';
import 'login.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', 
      routes: {
        '/login': (context) => const Login(), 
        '/home': (context) => const Home(),
        '/tamu': (context) => const Tamu(),
        '/rsvp': (context) => const RSVP(),
        '/pengaturan': (context) => const Pengaturan(),
        
      },
    );
  }
}

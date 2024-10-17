import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_pref_app/home_screen.dart';
import 'package:shared_pref_app/login_screen.dart';
import 'package:shared_pref_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preference',
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 102, 183)),
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      home: const SplashScreen(),
    );
  }
}

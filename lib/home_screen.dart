import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_pref_app/login_screen.dart';
import 'package:shared_pref_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentName = '';

  @override
  void initState() {
    super.initState();
    loadName();
  }

  void saveUserName(String userName) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('uName', userName);
    setState(() {
      currentName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $currentName',
              style: GoogleFonts.raleway(fontSize: 30),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 96, 64, 52),
                  foregroundColor: Colors.white),
              onPressed: () => saveUserName('Siraj Shah'),
              child: const Text(
                'Save Name',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  void loadName() async {
    var prefs = await SharedPreferences.getInstance();
    var previousName = prefs.getString('uName');
    setState(() {
      currentName = previousName ?? 'No name yet';
    });
  }
}

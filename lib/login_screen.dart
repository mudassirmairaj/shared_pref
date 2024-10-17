import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_pref_app/home_screen.dart';
import 'package:shared_pref_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // check login credentials is valid or not and save in prefs
  String name = 'test';

  void validToLogin(String inpuTName) async {
    var userInp = inpuTName;
    var prefs = await SharedPreferences.getInstance();

    if (userInp == name) {
      print(userInp == name);
      prefs.setBool(SplashScreenState.KEYNAME, true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back',
                style: GoogleFonts.lato(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome Back to Your Grooming Hub',
                style: GoogleFonts.lato(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 138, 133, 133)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Username',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // backgroundColor: const Color.fromARGB(255, 96, 64, 52),
                    foregroundColor: Colors.white),
                onPressed: () => validToLogin('test'),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

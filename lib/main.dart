import 'package:flight_to_mars/screens/about.dart';
import 'package:flight_to_mars/screens/admin.dart';
import 'package:flight_to_mars/screens/home.dart';
import 'package:flight_to_mars/screens/otp.dart';
import 'package:flight_to_mars/screens/register.dart';
import 'package:flight_to_mars/screens/successful.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Unable to Initialize Firebase');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flight to Mars',
            routes: {
              "/home": (context) => HomePage(),
              "/register": (context) => RegisterPage(),
              "/about": (context) => AboutPage(),
              '/success': (context) => SuccessfullSubmission(),
              '/otp': (context) => OTPVerification(),
              "/admin": (context) => AdminPanel()
            },
            home: HomePage(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

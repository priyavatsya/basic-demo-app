import 'package:app_demo/screens/dashboard/Dashboard.dart';
import 'package:app_demo/screens/signin/SignIn.dart';
import 'package:app_demo/screens/signup/SignUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}

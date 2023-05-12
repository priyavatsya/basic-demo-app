import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _password;
  late String _confirmPassword;

  bool _autoValidate = false;
  bool _obscureText = true;

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      // Save user details locally (e.g. using shared preferences or database)

      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }


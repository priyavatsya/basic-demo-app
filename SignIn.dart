import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/Dashboard.dart';
import 'SocialButton.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _autoValidate = false;

  Future<void> _saveUserData(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 20),
              MaterialButton(
                child: Text('Sign In'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _saveUserData(
                      _emailController.text,
                      _passwordController.text,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(
                            // email: _emailController.text,
                            // password: _passwordController.text,
                            ),
                      ),
                    );
                  } else {
                    setState(() {
                      _autoValidate = true;
                    });
                  }
                },
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: Icons.facebook,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 20),
                  // SocialButton(icon: Icons.twitter),
                  // SizedBox(width: 20),
                  // SocialButton(icon: Icons.google),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

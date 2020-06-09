import 'package:flutter/material.dart';
import 'package:quizzmaker/services/auth.dart';
import 'package:quizzmaker/views/home.dart';
import 'package:quizzmaker/views/signin.dart';
import 'package:quizzmaker/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
  AuthService authService = AuthService();
  bool _isLoading = false;

  signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .signUpWithEmaiAndPassword(email, password)
          .then((value) {
        if (value != null) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty ? 'Please, enter a name!' : null;
                      },
                      decoration: InputDecoration(hintText: 'Name'),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(height: 6.0),
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? 'Please, enter an email id!'
                            : null;
                      },
                      decoration: InputDecoration(hintText: 'Email'),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(height: 6.0),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        return value.isEmpty
                            ? 'Please, enter valid password!'
                            : null;
                      },
                      decoration: InputDecoration(hintText: 'Password'),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(height: 24.0),
                    GestureDetector(
                      onTap: () {
                        signUp();
                      },
                      child: blueButton(context, 'Sign Up!'),
                    ),
                    SizedBox(height: 18.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account? ',
                          style: TextStyle(fontSize: 15.5),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 15.5,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.0)
                  ],
                ),
              ),
            ),
    );
  }
}

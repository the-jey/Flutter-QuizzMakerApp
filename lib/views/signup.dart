import 'package:flutter/material.dart';
import 'package:quizzmaker/views/signin.dart';
import 'package:quizzmaker/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Form(
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
                  return value.isEmpty ? 'Please, enter an email id!' : null;
                },
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 6.0),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? 'Please, enter valid password!' : null;
                },
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 24.0),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0)),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Sign Up!',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 15.5, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 88.0)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizzmaker/services/auth.dart';
import 'package:quizzmaker/views/home.dart';
import 'package:quizzmaker/views/signup.dart';
import 'package:quizzmaker/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = AuthService();

  bool _isLoading = false;

  signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      await authService.sigInEmailAndPass(email, password).then((value) {
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
                        signIn();
                      },
                      child: blueButton(context: context, label: 'Sign In!'),
                    ),
                    SizedBox(height: 18.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(fontSize: 15.5),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            'Sign Up!',
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

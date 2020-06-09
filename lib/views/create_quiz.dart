import 'package:flutter/material.dart';
import 'package:quizzmaker/widgets/widgets.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizzImageUrl, quizzTitle, quizzDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? 'Please enter an image URL!' : null,
                decoration: InputDecoration(
                  hintText: 'Quizz Image URL ',
                ),
                onChanged: (value) {
                  quizzImageUrl = value;
                },
              ),
              SizedBox(height: 6.0),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? 'Please enter a title!' : null,
                decoration: InputDecoration(
                  hintText: 'Quizz Title',
                ),
                onChanged: (value) {
                  quizzTitle = value;
                },
              ),
              SizedBox(height: 6.0),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? 'Please enter a description!' : null,
                decoration: InputDecoration(
                  hintText: 'Quizz Description ',
                ),
                onChanged: (value) {
                  quizzDescription = value;
                },
              ),
              Spacer(),
              blueButton(context, 'Create Quizz!'),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

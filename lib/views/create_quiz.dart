import 'package:flutter/material.dart';
import 'package:quizzmaker/services/database.dart';
import 'package:quizzmaker/views/add_question.dart';
import 'package:quizzmaker/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizzImageUrl, quizzTitle, quizzDescription, quizzId;
  DatabaseService databaseService = DatabaseService();

  bool _isLoading = false;

  createQuizzOnline() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      quizzId = randomAlphaNumeric(16);

      Map<String, String> quizzMap = {
        'quizzId': quizzId,
        'quizzImgUrl': quizzImageUrl,
        'quizzTitle': quizzTitle,
        'quizzDesc': quizzDescription,
      };

      await databaseService.addQuizzData(quizzMap, quizzId).then((value) {
        setState(() {
          setState(() {
            _isLoading = false;
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AddQuestion(quizzId)));
          });
        });
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
        iconTheme: IconThemeData(color: Colors.black54),
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
                    GestureDetector(
                      onTap: () => createQuizzOnline(),
                      child:
                          blueButton(context: context, label: 'Create Quizz!'),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
    );
  }
}

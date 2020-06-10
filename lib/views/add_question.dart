import 'package:flutter/material.dart';
import 'package:quizzmaker/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Please enter a question!' : null,
              decoration: InputDecoration(
                hintText: 'Question',
              ),
              onChanged: (value) {
                question = value;
              },
            ),
            SizedBox(height: 6.0),
            TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Please enter an option 1!' : null,
              decoration: InputDecoration(
                hintText: 'Option1 (correct answer)',
              ),
              onChanged: (value) {
                option1 = value;
              },
            ),
            SizedBox(height: 6.0),
            TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Please enter an option 2!' : null,
              decoration: InputDecoration(
                hintText: 'Option 2',
              ),
              onChanged: (value) {
                option2 = value;
              },
            ),
            SizedBox(height: 6.0),
            TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Please enter an option 3!' : null,
              decoration: InputDecoration(
                hintText: 'Option 3',
              ),
              onChanged: (value) {
                option3 = value;
              },
            ),
            SizedBox(height: 6.0),
            TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Please enter an option 4!' : null,
              decoration: InputDecoration(
                hintText: 'Option 4',
              ),
              onChanged: (value) {
                option4 = value;
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //TODO
                  },
                  child: blueButton(
                    context: context,
                    label: 'Submit',
                    buttonWidth: (MediaQuery.of(context).size.width / 2.5),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO:
                  },
                  child: blueButton(
                    context: context,
                    label: 'Add Question',
                    buttonWidth: (MediaQuery.of(context).size.width / 2.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }
}

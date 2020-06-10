import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizzmaker/models/question.dart';
import 'package:quizzmaker/services/database.dart';
import 'package:quizzmaker/views/result.dart';
import 'package:quizzmaker/widgets/quizz_play_widgets.dart';
import 'package:quizzmaker/widgets/widgets.dart';

class PlayQuizz extends StatefulWidget {
  final String quizzId;
  PlayQuizz(this.quizzId);

  @override
  _PlayQuizzState createState() => _PlayQuizzState();
}

int total = 0;
int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;

class _PlayQuizzState extends State<PlayQuizz> {
  DatabaseService databaseService = DatabaseService();
  QuerySnapshot questionSnapshot;

  QuestionModel getQuestionModelFromDataSnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = QuestionModel();

    questionModel.question = questionSnapshot.data['question'];

    List<String> options = [
      questionSnapshot.data['option1'],
      questionSnapshot.data['option2'],
      questionSnapshot.data['option3'],
      questionSnapshot.data['option4'],
    ];
    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionSnapshot.data['option1'];
    questionModel.answered = false;

    return questionModel;
  }

  @override
  void initState() {
    databaseService.getQuestionData(widget.quizzId).then((value) {
      questionSnapshot = value;
      _notAttempted = 0;
      _correct = 0;
      _incorrect = 0;
      total = questionSnapshot.documents.length;

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              questionSnapshot != null
                  ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      itemCount: questionSnapshot.documents.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return QuizzPlayTile(
                            questionModel: getQuestionModelFromDataSnapshot(
                                questionSnapshot.documents[index]),
                            index: index);
                      },
                    )
                  : Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Results(
                        correct: _correct,
                        incorrect: _incorrect,
                        total: total,
                      )));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class QuizzPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;
  QuizzPlayTile({@required this.questionModel, @required this.index});

  @override
  _QuizzPlayTileState createState() => _QuizzPlayTileState();
}

class _QuizzPlayTileState extends State<QuizzPlayTile> {
  String optionSelected = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Q${widget.index + 1}. ${widget.questionModel.question}',
            style: TextStyle(fontSize: 17.0, color: Colors.black),
          ),
          SizedBox(height: 4.0),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.correctOption,
              description: widget.questionModel.option1,
              option: 'A',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(height: 4.0),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.correctOption,
              description: widget.questionModel.option2,
              option: 'B',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(height: 4.0),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.correctOption,
              description: widget.questionModel.option3,
              option: 'C',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(height: 4.0),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTile(
              correctAnswer: widget.questionModel.correctOption,
              description: widget.questionModel.option4,
              option: 'D',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizzmaker/views/home.dart';
import 'package:quizzmaker/widgets/widgets.dart';

class Results extends StatefulWidget {
  final int correct, incorrect, total;
  Results({this.correct, this.incorrect, this.total});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${widget.correct}/${widget.total}',
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'You answered ${widget.correct} answers correctly and ${widget.incorrect} answers incorrectly',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
              SizedBox(height: 14.0),
              GestureDetector(
                child: blueButton(context: context, label: 'Go to Home!'),
                onTap: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

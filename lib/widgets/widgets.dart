import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: <TextSpan>[
        TextSpan(
          text: 'Quizz',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: 'Maker',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Widget blueButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(30.0)),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
  );
}

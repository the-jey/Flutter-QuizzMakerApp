import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future addQuizzData(Map quizzData, String quizzId) async {
    await Firestore.instance
        .collection('Quizz')
        .document(quizzId)
        .setData(quizzData)
        .catchError((e) => print(e.toString()));
  }
}

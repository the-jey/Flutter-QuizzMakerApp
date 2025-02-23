import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addQuizzData(Map quizzData, String quizzId) async {
    await Firestore.instance
        .collection('Quizz')
        .document(quizzId)
        .setData(quizzData)
        .catchError((e) => print(e.toString()));
  }

  Future<void> addQuestionData(Map questionData, String quizzId) async {
    await Firestore.instance
        .collection('Quizz')
        .document(quizzId)
        .collection('QNA')
        .add(questionData)
        .catchError((e) => print(e.toString()));
  }

  Future getQuizzData() async {
    return Firestore.instance.collection('Quizz').snapshots();
  }

  Future getQuestionData(String quizzId) async {
    return await Firestore.instance
        .collection('Quizz')
        .document(quizzId)
        .collection('QNA')
        .getDocuments();
  }
}

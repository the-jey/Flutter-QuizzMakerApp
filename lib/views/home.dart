import 'package:flutter/material.dart';
import 'package:quizzmaker/services/database.dart';
import 'package:quizzmaker/views/create_quiz.dart';
import 'package:quizzmaker/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizzStream;
  DatabaseService databaseService = DatabaseService();

  Widget quizzList() {
    return Container(
      child: StreamBuilder(
        stream: quizzStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return QuizzTile(
                      imageUrl:
                          snapshot.data.documents[index].data['quizzImgUrl'],
                      title: snapshot.data.documents[index].data['quizzTitle'],
                      description:
                          snapshot.data.documents[index].data['quizzDesc'],
                    );
                  },
                );
        },
      ),
    );
  }

  @override
  void initState() {
    databaseService.getQuizzData().then((value) {
      quizzStream = value;
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
      ),
      body: quizzList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
      ),
    );
  }
}

class QuizzTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  QuizzTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 8.0),
      height: 150.0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 6.0),
                Text(
                  description,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test555/model/addscore.dart';
import 'package:test555/model/user_model.dart';
import 'package:test555/widgetstu/stuone.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dio/dio.dart';
import 'package:test555/utility/normal_dialog.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, this.marks}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

final assetsAudioPlayer = AssetsAudioPlayer();
UserModel userModel = UserModel();

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 50) {
      assetsAudioPlayer.open(
        Audio("assets/sad.mp3"),
      );
      image = images[2];
      message = "ตั้งใจหน่อยยยยย ....\n" + "คะเเนนของคุณ $marks/100";
    } else if (marks < 70) {
      assetsAudioPlayer.open(
        Audio("assets/happy.mp3"),
      );
      image = images[1];
      message =
          "เก่งมากเเต่ยังเก่งได้กว่านี้ ....\n" + "คะเเนนของคุณ $marks/100";
    } else {
      assetsAudioPlayer.open(
        Audio("assets/happy.mp3"),
      );
      image = images[0];
      message = "สุดยอด คุณคือเบอร์ 1 ....\n" + "คะเเนนของคุณ $marks/100";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "สิ้นสุดเเบบทดสอบ",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: "Quando",
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Score = $marks ');

                    assetsAudioPlayer.stop();
                    addScore();
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  //  padding: EdgeInsets.symmetric(
                  //         vertical: 10.0,
                  //        horizontal: 25.0,
                ),
                //      borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                //       splashColor: Colors.indigoAccent,
                //    ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String subjectid, user;

  Future<Null> addScore() async {
    String user = userModel.user;

    print(
      'score = $marks',
    );
  }
}

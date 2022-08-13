import 'dart:async';

import 'package:flutter/material.dart';

class TimerTry extends StatefulWidget {
  const TimerTry({Key? key}) : super(key: key);

  @override
  State<TimerTry> createState() => _TimerTryState();
}

class _TimerTryState extends State<TimerTry> {
  List Photo = [
    "https://cdn.pixabay.com/photo/2022/04/20/20/23/bee-7146136_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/01/23/16/06/dog-6961236_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/07/12/20/15/cavia-7318119_960_720.jpg",
    "https://cdn.pixabay.com/photo/2021/12/14/09/22/animal-6870147_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/08/04/09/12/sea-7364224_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/08/03/08/11/sea-7362107_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/06/19/08/56/ladybug-7271402_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/07/30/16/39/roe-deer-7354145_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/04/10/19/33/house-7124141_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/04/20/20/23/bee-7146136_960_720.jpg",
  ];
  int no = 0;
  var timerVar;
  var buttonColor = Colors.lightBlue;
  var resetButtonColor = Colors.lightBlue;
  var pauseButtonColor = Colors.lightBlue;
  var rpColor = Colors.lightBlue;
  var contColor = Colors.grey;
  String contText = "";
  int CountNum = 1;
  void _startCount() {
    timerVar = Timer.periodic(Duration(seconds: 1), (timer) {
      if (CountNum < 11 && no < 9) {
        setState(() {
          CountNum++;
          buttonColor = Colors.red;
          pauseButtonColor = Colors.lightBlue;
          resetButtonColor = Colors.lightBlue;
          rpColor = Colors.lightBlue;
          no = no + 1;
        });
      } else {
        timer.cancel();
      }
      // return timer;
    });
  }

  void _resetCount() {
    setState(() {
      CountNum = 1;
      no = 0;
      resetButtonColor = Colors.red;
      buttonColor = Colors.lightBlue;
      pauseButtonColor = Colors.lightBlue;
      rpColor = Colors.lightBlue;
    });
  }

  void _pauseCount() {
    // CountNum = CountNum;
    setState(() {
      resetButtonColor = Colors.lightBlue;
      buttonColor = Colors.lightBlue;
      pauseButtonColor = Colors.red;
      rpColor = Colors.lightBlue;
    });
    timerVar.cancel();
  }

  void _resetPause() {
    setState(() {
      CountNum = 1;
      no = 0;
      resetButtonColor = Colors.lightBlue;
      buttonColor = Colors.lightBlue;
      pauseButtonColor = Colors.lightBlue;
      rpColor = Colors.red;
    });
    timerVar.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 50,
          width: 50,
          color: contColor,
          child: Text(
            contText,
            style: TextStyle(fontSize: 90, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 450,
              width: 500,
              child: Image.network(Photo[no]),
            ),
            Text(
              CountNum == 10 ? "No more images" : "$CountNum/10",
              style: TextStyle(fontSize: 30),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: pauseButtonColor,
                  onPressed: _pauseCount,
                  child: Icon(
                    Icons.pause_rounded,
                  ),
                ),
                MaterialButton(
                  onPressed: _startCount,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 60,
                      width: 120,
                      color: buttonColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Text(
                          "START",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: resetButtonColor,
                  onPressed: _resetCount,
                  child: Icon(
                    Icons.restart_alt_rounded,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        onPressed: _resetPause,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                  backgroundColor: rpColor, onPressed: () {}),
            ),
            Positioned(
              bottom: 10,
              left: 8,
              child: Icon(
                Icons.restart_alt_rounded,
                color: Colors.white,
                size: 60,
              ),
            ),
            Positioned(
              top: 26,
              left: 25,
              child: Icon(
                Icons.pause_rounded,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

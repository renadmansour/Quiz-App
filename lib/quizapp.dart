import 'package:another_flushbar/flushbar.dart';
import 'package:quiz_app/question&answer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_glow_border/gradient_glow_border.dart';

class Quizapp extends StatefulWidget {
  const Quizapp({super.key});

  @override
  State<Quizapp> createState() => _QuizappState();
}

class _QuizappState extends State<Quizapp> {
  List<Question> questionlist = getquestions();
  int currentQuestion = 0;
  Answer? selectedAnswer;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        spacing: 30,
        children: [
          Text(
            'Quizapp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          Text(
            'Question ${currentQuestion + 1}/${questionlist.length}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(left: 27, right: 27),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  questionlist[currentQuestion].questiontext,
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 35,
                left: -20,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                ),
              ),
              Positioned(
                top: 35,
                right: -20,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                ),
              ),
              Positioned(
                top: -25,
                left: 0,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 35,
                  ),
                ),
              )
            ],
          ),
          for (Answer an in questionlist[currentQuestion].answerlist)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedAnswer = an;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedAnswer == an ? Colors.orange : Colors.white,
              ),
              child: Text(an.answertext),
            ),
          SizedBox(
            height: 50,
            width: 200,
            child: GradientGlowBorder.normalGradient(
              borderRadius: BorderRadius.circular(15),
              blurRadius: 1,
              spreadRadius: 1,
              colors: [Colors.blue, Colors.red],
              glowOpacity: 1,
              duration: Duration(milliseconds: 800),
              thickness: 3,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAnswer == null) {
                    Flushbar(
                      message: "you have to select an answer",
                      icon: Icon(
                        Icons.error,
                        size: 28.0,
                        color: Colors.red,
                      ),
                      duration: Duration(seconds: 3),
                      leftBarIndicatorColor: Colors.red,
                    ).show(context);
                  } else {
                    if (selectedAnswer!.iscorrect) {
                      score++;
                    }
                    if (currentQuestion == questionlist.length - 1) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Score'),
                              content: SizedBox(
                                height: 150,
                                child: Column(
                                  children: [
                                    score > questionlist.length / 2
                                        ? Text(
                                            'passed  | $score',
                                            style:
                                                TextStyle(color: Colors.green),
                                          )
                                        : Text(
                                            ' Failed  | $score',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          currentQuestion = 0;
                                          selectedAnswer = null;
                                          score = 0;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text('Restart'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      setState(() {
                        currentQuestion++;
                        selectedAnswer = null;
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 40),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                child: Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  Alert endOfQuizAlert(BuildContext context) => Alert(
    context: context,
    closeIcon: Icon(Icons.close),
    closeFunction: () => Navigator.pop(context),
    title: "Finished!",
    desc: "You reached the end of Quiz!",
    style: AlertStyle(
      isButtonVisible: false,
      titleStyle: TextStyle(fontSize: 30),
      descStyle: TextStyle(fontSize: 20),
    ),
  );

  bool computeAnswer({required bool userChoice}) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    return correctAnswer == userChoice;
  }

  void updateScoreKeeper({required bool userWasRight}) {
    if (userWasRight) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
  }

  void checkAnswer({required bool userChoice}) {
    bool wasCorrect = computeAnswer(userChoice: userChoice);
    updateScoreKeeper(userWasRight: wasCorrect);
    quizBrain.nextQuestion();

    if (quizBrain.reachedEndOfQuiz()) {
      scoreKeeper.clear();
      quizBrain.reset();
      endOfQuizAlert(context).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  checkAnswer(userChoice: true);
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  checkAnswer(userChoice: false);
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}

/*
Alert(
                  context: context,
                  closeIcon: Icon(Icons.close),
                  closeFunction: () => Navigator.pop(context),
                  title: "Finished!",
                  desc: "You reached the end of Quiz!",
                  style: AlertStyle(
                    isButtonVisible: false,
                    titleStyle: TextStyle(fontSize: 30),
                    descStyle: TextStyle(fontSize: 20),
                  ),
                ).show();
*/

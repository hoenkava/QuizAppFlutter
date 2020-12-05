import 'package:flutter/material.dart';
// import 'question.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizb = new QuizBrain();

void main() {
  runApp(Quizapp());
}

class Quizapp extends StatefulWidget {
  @override
  _QuizappState createState() => _QuizappState();
}

class _QuizappState extends State<Quizapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: quizPage(),
          ),
        ),
      ),
    );
  }
}

class quizPage extends StatefulWidget {
  @override
  _quizPageState createState() => _quizPageState();
}

class _quizPageState extends State<quizPage> {
  List<Widget> scoreKeeper = [];
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizb.getAnswer();
    setState(() {
      if (quizb.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Quiz Over",
          desc: "All questions have been Finished.",
          buttons: [
            DialogButton(
              child: Text(
                "Start Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => {Navigator.pop(context)},
              width: 120,
            )
          ],
        ).show();
        quizb.reset();
        scoreKeeper = [];
      } else if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      quizb.nextQuestion();
    });
  }

  // List<String> questions = [
  //   'You can lead a cow downstairs but not upstairs.',
  //   'Approximately one quarter of the human bones are in the feet.',
  //   'A slug\s blood is green.'
  // ];
  // List<bool> answers = [false, true, true];
  // Question q1 =
  //     Question(q: 'You can lead a cow downstairs but not upstairs', a: false);

  // List<Question> questionBucket = [
  //   Question(q: 'You can lead a cow downstairs but not upstairs.', a: false),
  //   Question(
  //       q: 'Approximately one quarter of the human bones are in the feet.',
  //       a: true),
  //   Question(q: 'A slug\s blood is green.', a: true)
  // ];
  // int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                // quizb.questionBucket[questionNumber].questionText,
                // quizb.getQuestion(questionNumber),
                quizb.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                  // bool correctAnswer =
                  // quizb.questionBucket[questionNumber].questionAnswer;
                  // quizb.getAnswer(questionNumber);
                  //     quizb.getAnswer();
                  // if (correctAnswer == true) {
                  //   scoreKeeper.add(
                  //     Icon(
                  //       Icons.check,
                  //       color: Colors.green,
                  //     ),
                  //   );
                  // } else {
                  //   scoreKeeper.add(
                  //     Icon(
                  //       Icons.close,
                  //       color: Colors.red,
                  //     ),
                  //   );
                  // }
                  // questionNumber++;
                  // quizb.nextQuestion();
                  // scoreKeeper.add(
                  //   Icon(
                  //     Icons.check,
                  //     color: Colors.green,
                  //   ),
                  // );
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                  // bool correctAnswer =
                  // quizb.questionBucket[questionNumber].questionAnswer;
                  // quizb.getAnswer(questionNumber);
                  //     quizb.getAnswer();
                  // if (correctAnswer == false) {
                  //   scoreKeeper.add(
                  //     Icon(
                  //       Icons.check,
                  //       color: Colors.green,
                  //     ),
                  //   );
                  // } else {
                  //   scoreKeeper.add(
                  //     Icon(
                  //       Icons.close,
                  //       color: Colors.red,
                  //     ),
                  //   );
                  // }
                  // // questionNumber++;
                  // quizb.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
          // children: <Widget>[
          //   Icon(
          //     Icons.check,
          //     color: Colors.green,
          //   ),
          //   Icon(
          //     Icons.close,
          //     color: Colors.red,
          //   ),
          //   Icon(
          //     Icons.close,
          //     color: Colors.red,
          //   ),
          //   Icon(
          //     Icons.close,
          //     color: Colors.red,
          //   ),
          //   Icon(
          //     Icons.close,
          //     color: Colors.red,
          //   )
          // ],
        )
      ],
    );
  }
}

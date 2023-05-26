import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Quiz!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> quizData = [
    {
      'question': 'Question 1: What is the capital of France?',
      'choices': ['Paris', 'Rome', 'Madrid', 'London'],
      'correctChoice': 0,
    },
    {
      'question': 'Question 2: Which planet is known as the Red Planet?',
      'choices': ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      'correctChoice': 1,
    },
    // Add more questions here
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(int selectedChoiceIndex) {
    if (selectedChoiceIndex == quizData[currentQuestionIndex]['correctChoice']) {
      setState(() {
        score++;
      });
    }

    if (currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(score: score, totalQuestions: quizData.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quizData[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Column(
              children: List<Widget>.generate(
                quizData[currentQuestionIndex]['choices'].length,
                (index) => ElevatedButton(
                  onPressed: () => checkAnswer(index),
                  child: Text(quizData[currentQuestionIndex]['choices'][index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultPage({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/quiz_page.dart';
import 'package:quiz_app/pages/result_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<String> results;
  late Widget activePage;

  void saveAnswer(String answer) {
    results.add(answer);

    if (results.length == questions.length) {
      setState(() {
        activePage = ResultPage(
          numberOfCorrect: answers.toSet().intersection(results.toSet()).length,
          results: results,
          changePage: goToHomePage,
        );
      });
    }
  }

  void goToQuizPage() {
    setState(() {
      activePage = QuizPage(saveAnswer: saveAnswer);
    });
  }

  void goToHomePage() {
    setState(() {
      activePage = HomePage(
        changePage: goToQuizPage,
      );
      results = [];
    });
  }

  // INITSTATE
  @override
  void initState() {
    super.initState();
    activePage = HomePage(changePage: goToQuizPage);
    results = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAB12F),
        title: Text(
          "Quiz Game",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        centerTitle: true,
      ),
      body: activePage,
    );
  }
}

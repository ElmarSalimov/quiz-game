import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/my_button.dart';

class QuizPage extends StatefulWidget {
  QuizPage({super.key, required this.saveAnswer});
  final void Function(String answer) saveAnswer;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void nextQuestion(String answer) {
    setState(() {
      currentIndex += 1;
      widget.saveAnswer(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xFFFA812F)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.title, textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ))),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.answers.map((question) {
            return MyButton(
              answerTitle: question,
              onTap: () => nextQuestion(question),
            );
          })
        ],
      ),
    );
  }
}

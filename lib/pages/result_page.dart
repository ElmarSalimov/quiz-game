import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/question.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(
      {super.key,
      required this.numberOfCorrect,
      required this.results,
      required this.changePage});

  final int numberOfCorrect;
  final List<String> results;
  final void Function() changePage;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xFFFA812F)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered ${widget.numberOfCorrect} out of 5 questions correcly!",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.white, fontSize: 20)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: questions.length,
            itemBuilder: (BuildContext context, int index) {
              Question question = questions[index];
              String userAnswer = widget.results[index];

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                padding: const EdgeInsets.all(6),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: userAnswer == question.answers[0]
                              ? Colors.greenAccent
                              : Colors.red,
                        ),
                        child: Center(
                            child: Icon(
                          userAnswer == question.answers[0]
                              ? LucideIcons.check
                              : LucideIcons.x,
                          color: Colors.white,
                        ))),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            textAlign: TextAlign.start,
                            userAnswer,
                            style: GoogleFonts.openSans(fontSize: 12)),
                        Text(
                          textAlign: TextAlign.start,
                          "Correct answer: ${question.answers[0]}",
                          style: GoogleFonts.openSans(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          GestureDetector(
            onTap: widget.changePage,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 249, 233, 208),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text("Restart", style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ) 
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.answerTitle, required this.onTap});

  final String answerTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          width: 200,
          height: 40,
          decoration: BoxDecoration(
              color: const Color(0xFFFEF3E2), borderRadius: BorderRadius.circular(6)),
          child: Center(
            child: Text(answerTitle,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ))),
          ),
        ));
  }
}

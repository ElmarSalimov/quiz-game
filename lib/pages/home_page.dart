import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.changePage});
  final void Function() changePage;

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xFFFA812F)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              'lib/assets/colosseum.png',
              width: 350,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(6)
            ),
            child: TextButton(
                onPressed: widget.changePage,
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:quiz_app/models/question.dart';

List<String> answers = [
  "George Washington",
  "1912",
  "The ancient Egyptians",
  "1945",
  "Queen Elizabeth I"
];

List<Question> questions = [
  Question(
      title: "Who was the first President of the United States?",
      answers: [
        "George Washington",
        "Abraham Lincoln",
        "Thomas Jefferson",
        "Benjamin Franklin"
      ]),
  Question(
      title: "In which year did the Titanic sink?",
      answers: ["1912", "1905", "1921", "1898"]),
  Question(title: "Which ancient civilization built the pyramids?", answers: [
    "The ancient Egyptians",
    "The Romans",
    "The Mayans",
    "The Greeks"
  ]),
  Question(
      title: "What year did World War II end?",
      answers: ["1945", "1939", "1950", "1940"]),
  Question(
      title: "Who was the Queen of England during the Spanish Armada in 1588?",
      answers: [
        "Queen Elizabeth I",
        "Queen Victoria",
        "Queen Mary I",
        "Queen Anne"
      ]),
];

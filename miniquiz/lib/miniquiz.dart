library miniquiz;

import 'package:flutter/material.dart';
import 'package:miniquiz/screens/quiz_home_page.dart';

class MiniQuiz extends StatelessWidget {
  static const routeName = '/mini-quiz';

  const MiniQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuizHomePage();
  }
}

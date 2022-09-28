import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myquizapp/controller/question_controller.dart';

import 'component/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            clipBehavior: Clip.none,
            autofocus: true,
            onPressed: _controller.nextQuestion,
            child: const Text('Skip'),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}

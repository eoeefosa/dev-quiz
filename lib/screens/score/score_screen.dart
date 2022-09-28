import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myquizapp/constants.dart';
import 'package:myquizapp/controller/question_controller.dart';
import 'package:myquizapp/models/Questions.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset(
            'assets/icons/bg.svg',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context).textTheme.headline3!.copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
              Text(
                "${_questionController.correctAns * 10}/${_questionController.questionNumber * 10}",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kSecondaryColor,
                    ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}

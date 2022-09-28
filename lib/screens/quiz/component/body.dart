import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myquizapp/constants.dart';
import 'package:myquizapp/controller/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'progressbar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to access controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      fit: StackFit.expand,
      children: [
        WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.cover),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(text: "/${_questionController.questions.length}", style: Theme.of(context).textTheme.headline5!.copyWith(color: kSecondaryColor)),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next question
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQuestionNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) {
                    return QuestionCard(question: _questionController.questions[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myquizapp/controller/question_controller.dart';

import '../../../constants.dart';

class Options extends StatelessWidget {
  Options({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;
  List<String> letter = ['A', 'B', 'C', 'D', 'E'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qncontroller) {
        Color getTheRightColor() {
          if (qncontroller.isAnswered) {
            if (index == qncontroller.correctAns) {
              return kGreenColor;
            } else if (index == qncontroller.selectedAns && qncontroller.selectedAns != qncontroller.correctAns) {
              return kRedColor;
            }
          }
          return kGrayColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${letter[index]}\t $text",
                  style: const TextStyle(color: kGrayColor, fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor ? Colors.transparent : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor()),
                  ),
                  child: getTheRightColor() == kGrayColor
                      ? null
                      : Icon(
                          getTheRightIcon(),
                          // size: 16,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

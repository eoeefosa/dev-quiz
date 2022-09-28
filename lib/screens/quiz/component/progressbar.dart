import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myquizapp/controller/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                // LayoutBuilder provide us the available space for the container
                // constraints.maxwith needed for our animation
                LayoutBuilder(
                  builder: (context, constriants) {
                    return Container(
                      // from 0.0 to 1.0 it takes 60seconds
                      width: constriants.maxWidth * controller.animation.value, // cover 50%
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    );
                  },
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${doubletoint(controller.animation.value * 60)} sec"),
                        WebsafeSvg.asset("assets/icons/clock.svg"),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }

  int doubletoint(double value) {
    return value.toInt();
  }
}

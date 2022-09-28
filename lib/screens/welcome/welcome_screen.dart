import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myquizapp/constants.dart';
import 'package:myquizapp/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.cover),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2), // 2/6
                Text(
                  "Let's Play Quiz,",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Text('Enter your information below'),
                const Spacer(), // 1/6
                const TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFF1C2341),
                    filled: true,
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                const Spacer(), // 1/6
                InkWell(
                  onTap: () => Get.to(() => const QuizScreen()),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                    decoration: const BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      'Lets Start Quiz',
                      style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                const Spacer(flex: 2), //it will take 2/6 space
              ],
            ),
          ))
        ],
      ),
    );
  }
}

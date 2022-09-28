import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myquizapp/models/Questions.dart';
import 'package:myquizapp/screens/score/score_screen.dart';

// using get package for statemanagement
class QuestionController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  // getter to access the private field '_animation'
  Animation get animation => _animation;

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

//convert the map to a list of type question
  final List<Question> _questions = sample_data
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index'],
        ),
      )
      .toList();
// private members of the class
  bool _isAnswered = false;
  late int _correctAns;
  late int _selectedAns;
  RxInt _questionNumber = 1.obs;
  int _numberOfCorrectAns = 0;

  // a  getter to acces private classes
  List<Question> get questions => _questions;
  bool get isAnswered => _isAnswered;
  int get correctAns => _correctAns;
  int get selectedAns => _selectedAns;
  RxInt get questionNumber => _questionNumber;
  int get numberOfCorrectAns => _numberOfCorrectAns;

// called immediately after the widget is allocated memory
  @override
  void onInit() async {
    _animationController = AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        // update like setstate
        update();
      });
    //start our animation
    // once 60s is completed go to the next question
    await _animationController.forward().whenComplete(() => nextQuestion());

    _pageController = PageController();
    super.onInit();
  }

// called just before the controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedindex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedindex;
    if (_correctAns == _selectedAns) _numberOfCorrectAns++;

// it will stop the counter
    _animationController.stop();
    update();
// Once user select an ans after 3s it will go to the next question
    Future.delayed(
      const Duration(seconds: 3),
      () {
        nextQuestion();
      },
    );
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
      // reset the coundter
      _animationController.reset();

      // then start it again
      // once timer is finish go to the next question
      _animationController.forward().whenComplete(() => nextQuestion());
    } else {
      // Get package provide us a simple way to navigate another page
      Get.to(() => const ScoreScreen());
    }
  }

  void updateTheQuestionNum(int index) {
    _questionNumber.value = index + 1;
  }
}

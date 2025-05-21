import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedAnswerIndex = -1;
  int currentQuestionIndex = 0;
  int secondsRemaining = 20;
  Timer? timer;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          "In 2017, which player became the leading run scorer of all time in women's ODI cricket?",
      'options': ["Stefanie Taylor", "Mithali Raj", "Suzie Bates", "Harmanpreet Kaur"],
      'correctIndex': 1
    },
    {
      'question': "Who won the Cricket World Cup 2019?",
      'options': ["India", "England", "New Zealand", "Australia"],
      'correctIndex': 1
    },
    {
      'question': "What is the capital of France?",
      'options': ["Berlin", "Madrid", "Paris", "Rome"],
      'correctIndex': 2
    },
    {
      'question': "Which planet is known as the Red Planet?",
      'options': ["Earth", "Mars", "Venus", "Jupiter"],
      'correctIndex': 1
    },
    {
      'question': "What is the largest mammal?",
      'options': ["Elephant", "Giraffe", "Blue Whale", "Shark"],
      'correctIndex': 2
    },
    {
      'question': "How many continents are there?",
      'options': ["5", "6", "7", "8"],
      'correctIndex': 2
    },
    {
      'question': "Which is the smallest prime number?",
      'options': ["0", "1", "2", "3"],
      'correctIndex': 2
    },
    {
      'question': "What gas do plants absorb?",
      'options': ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
      'correctIndex': 1
    },
    {
      'question': "Who painted the Mona Lisa?",
      'options': ["Van Gogh", "Picasso", "Da Vinci", "Rembrandt"],
      'correctIndex': 2
    },
    {
      'question': "Which ocean is the deepest?",
      'options': ["Atlantic", "Pacific", "Arctic", "Indian"],
      'correctIndex': 1
    },
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    secondsRemaining = 20;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
        setState(() {
          selectedAnswerIndex = -1;
        });
        goToNextQuestion();
      }
    });
  }

  void selectAnswer(int index) {
    if (selectedAnswerIndex == -1) {
      setState(() {
        selectedAnswerIndex = index;
      });
    }
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = -1;
      });
      startTimer();
    } else {
      timer?.cancel();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Quiz Completed!"),
          content: const Text("Thank you for participating."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questionData = questions[currentQuestionIndex];
    final options = questionData['options'] as List<String>;
    final correctAnswerIndex = questionData['correctIndex'];

    return Scaffold(
      backgroundColor: const Color(0xFFe5f0ff),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Play Quiz", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  Text("Skip", style: TextStyle(fontSize: 16.sp, color: Colors.blue)),
                ],
              ),
              SizedBox(height: 2.h),

              Stack(
                children: [
                  Container(
                    width: 100.w,
                    height: 2.h,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: (secondsRemaining / 20) * 100.w,
                    height: 2.h,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("$secondsRemaining Sec", style: TextStyle(fontSize: 14.sp, color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Question ${currentQuestionIndex + 1} / ${questions.length}",
                      style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      const Icon(Icons.people, size: 20, color: Colors.grey),
                      SizedBox(width: 1.w),
                      Text("265", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 2.h),

              Container(
                width: 100.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.w),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 5, offset: const Offset(2, 2)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(questionData['question'],
                        style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500)),
                    SizedBox(height: 2.h),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedAnswerIndex == index;
                        final isCorrect = correctAnswerIndex == index;

                        Color borderColor = Colors.grey;
                        Color bgColor = Colors.white;
                        IconData? icon;

                        if (selectedAnswerIndex != -1) {
                          if (isCorrect) {
                            bgColor = Colors.green.shade100;
                            borderColor = Colors.green;
                            icon = Icons.check_circle;
                          } else if (isSelected) {
                            bgColor = Colors.red.shade100;
                            borderColor = Colors.red;
                            icon = Icons.cancel;
                          }
                        }

                        return GestureDetector(
                          onTap: selectedAnswerIndex == -1 ? () => selectAnswer(index) : null,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(3.w),
                              border: Border.all(color: borderColor, width: 1.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text("${String.fromCharCode(65 + index)}. ${options[index]}",
                                      style: TextStyle(fontSize: 16.sp)),
                                ),
                                if (icon != null) Icon(icon, color: borderColor),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              Spacer(),

              Center(
                child: ElevatedButton(
                  onPressed: selectedAnswerIndex != -1 ? goToNextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                  ),
                  child: Text("Next", style: TextStyle(fontSize: 17.sp, color: Colors.white)),
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}

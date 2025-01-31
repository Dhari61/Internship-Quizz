import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizz/modal/questions.modal.dart';
import 'package:quizz/view/resultpage.dart';

class QuizzQuestions extends StatefulWidget {
  const QuizzQuestions({super.key});

  @override
  State<QuizzQuestions> createState() => _QuizzQuestionsState();
}

class _QuizzQuestionsState extends State<QuizzQuestions> {
  Question? info;
  int currentQuestionIndex = 0;
  Map<int, int?> selectedAnswers = {};
  int totalScore = 0;
  double progress = 0;
  List<Map<String, dynamic>> incorrectQuestions = [];

  late int totalTimeInSeconds; 
  int remainingTimeInSeconds = 0; 
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    try {
      var response = await http.get(Uri.parse("https://api.jsonserve.com/Uw5CrX"));
      if (response.statusCode == 200) {
        setState(() {
          info = Question.fromJson(jsonDecode(response.body));
          progress = 0;
          totalTimeInSeconds = 60 * 10; 
          remainingTimeInSeconds = totalTimeInSeconds;
          startTimer();
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTimeInSeconds > 0) {
        setState(() {
          remainingTimeInSeconds--;
        });
      } else {
        _timer.cancel();
        calculateScore();
        showSummaryPage();
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < (getTotalQuestions() - 1)) {
      setState(() {
        currentQuestionIndex++;
        progress = (currentQuestionIndex + 1) / getTotalQuestions();
      });
    } else {
      calculateScore();
      showSummaryPage();
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        progress = (currentQuestionIndex + 1) / getTotalQuestions();
      });
    }
  }

  void calculateScore() {
    totalScore = 0;
    incorrectQuestions.clear();
    selectedAnswers.forEach((index, selectedOption) {
      var question = info?.questions?[index];
      if (question != null && selectedOption != null) {
        if (question.options?[selectedOption].isCorrect == true) {
          totalScore++;
        } else {
          incorrectQuestions.add({
            'question': question.description ?? "Unknown Question",
            'selectedAnswer': question.options?[selectedOption].description ?? "No Answer",
            'correctAnswer': question.options?.firstWhere((option) => option.isCorrect == true).description ?? "No Correct Answer"
          });
        }
      }
    });
  }

  void showSummaryPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          totalScore: totalScore,
          totalQuestions: getTotalQuestions(),
          incorrectQuestions: incorrectQuestions,
          onRestart: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzQuestions()));
          },
        ),
      ),
    );
  }

  int getTotalQuestions() {
    return info?.questions?.length ?? 0;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (info == null || info!.questions!.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    var currentQuestion = info!.questions![currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Master! 🏆"),
        backgroundColor: const Color.fromARGB(255, 203, 191, 224),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time Left: ${formatTime(remainingTimeInSeconds)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),

            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 20),

            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.deepPurple.withOpacity(0.3), blurRadius: 8, spreadRadius: 2)],
              ),
              child: Text(
                "Q${currentQuestionIndex + 1}: ${currentQuestion.description}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.options?.length ?? 0,
                itemBuilder: (context, index) {
                  String optionLabel = String.fromCharCode(65 + index);
                  return AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    scale: selectedAnswers[currentQuestionIndex] == index ? 1.1 : 1.0,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: RadioListTile<int>(
                        title: Text(
                          "$optionLabel. ${currentQuestion.options![index].description ?? ""}",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        value: index,
                        groupValue: selectedAnswers[currentQuestionIndex],
                        onChanged: (value) {
                          setState(() {
                            selectedAnswers[currentQuestionIndex] = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0 ? previousQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 150, 188, 206), 
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      elevation: 10,
                    ),
                    child: const Text("Previous", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  ElevatedButton(
                    onPressed: selectedAnswers.containsKey(currentQuestionIndex) ? nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 204, 183, 240),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      elevation: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_forward, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          currentQuestionIndex < (getTotalQuestions() - 1) ? "Next ➡️" : "Submit ✅",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}

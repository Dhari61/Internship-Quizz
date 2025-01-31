import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int totalScore;
  final int totalQuestions;
  final List<Map<String, dynamic>> incorrectQuestions;
  final VoidCallback onRestart;

  const ResultPage({
    super.key,
    required this.totalScore,
    required this.totalQuestions,
    required this.incorrectQuestions,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    String resultMessage;
    double scorePercentage = totalScore / totalQuestions;

    if (scorePercentage == 1) {
      resultMessage = "Perfect! You nailed it! 🏅";
    } else if (scorePercentage >= 0.75) {
      resultMessage = "Great job! 🏆";
    } else if (scorePercentage >= 0.5) {
      resultMessage = "Good effort! Keep practicing! 🎯";
    } else {
      resultMessage = "Better luck next time! 💪";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Completed! 🎉"),
        backgroundColor: const Color.fromARGB(255, 203, 191, 224),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              resultMessage,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade700),
            ),
            Text(
              "$totalScore / $totalQuestions 🎯",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),

            if (incorrectQuestions.isNotEmpty) ...[
              const Text(
                "❌ Incorrect Questions:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: incorrectQuestions.length,
                  itemBuilder: (context, index) {
                    var incorrect = incorrectQuestions[index];
                    return ListTile(
                      leading: const Icon(Icons.error, color: Colors.red),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Q: ${incorrect['question']}", style: const TextStyle(fontSize: 16)),
                          Text(
                            "You answered: ${incorrect['selectedAnswer']}",
                            style: const TextStyle(color: Colors.red, fontSize: 14),
                          ),
                          Text(
                            "Correct answer: ${incorrect['correctAnswer']}",
                            style: const TextStyle(color: Colors.green, fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 5,
              ),
              child: const Text("Try Again!", style: TextStyle(fontSize: 18,color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

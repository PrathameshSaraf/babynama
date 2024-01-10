import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AutismViewModel extends ChangeNotifier {
  int currentQuestionIndex = 0;
  List<String> questions = [
    '1. Does your child have difficulty maintaining eye contact?',
    '2. Is your child sensitive to certain sounds or textures?',
    '3. Does your child engage in repetitive behaviors?',
    '4. Is your child delayed in language development?',
    '5. Does your child struggle with social interactions?',
  ];
  List<String> answers = ['Yes', 'No', 'Yes', 'No', 'Yes']; // Sample answers (replace with actual logic)

  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  void showResultSnackbar(String answer,BuildContext context) {
    String resultMessage =
    answer == answers[currentQuestionIndex] ? 'Autism Not Detected' : 'Autism Detected';
    Color resultColor = answer == answers[currentQuestionIndex] ? Colors.green : Colors.red;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(resultMessage),
        backgroundColor: resultColor,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void answerQuestion(String answer,BuildContext context) {
    if (currentQuestionIndex < questions.length - 1) {
      // Move to the next question
      currentQuestionIndex++;
      notifyListeners(); // Notify listeners to rebuild UI
    } else {
      // Display result Snackbar
      showResultSnackbar(answer,context);
    }
  }
}


import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(
      questionText: 'If you called me during a ranked match, I\'d let it ring.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'My PC gets more maintenance than our relationship.',
      questionAnswer: true,
    ),
    Question(
      questionText:
          'I\'d save my game before saving you from a zombie apocalypse.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Losing a game annoys me more than arguing with you.',
      questionAnswer: false,
    ),
    Question(
      questionText:
          'If you asked me to stop gaming for a week, I\'d need time to process that.',
      questionAnswer: true,
    ),
    Question(
      questionText: 'I know more video game lore than facts about your life.',
      questionAnswer: false,
    ),
    Question(
      questionText:
          'If we were both hanging off a cliff, I\'d grab my controller first.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'My ideal date is you watching me play games for 8 hours.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'I\'d notice a 5 FPS drop faster than a new haircut.',
      questionAnswer: true,
    ),
    Question(
      questionText: 'You\'re only my second favorite thing after gaming.',
      questionAnswer: false,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    if (_questionNumber < 0 || _questionNumber >= _questionBank.length) {
      throw Exception(
        'Invalid Operation, trying to get a question at invalid position, _questionNumber: $_questionNumber and Question Bank Length: ${_questionBank.length}',
      );
    }
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    if (_questionNumber < 0 || _questionNumber >= _questionBank.length) {
      throw Exception(
        'Invalid Operation, trying to get a answer at invalid position, _questionNumber: $_questionNumber and Question Bank Length: ${_questionBank.length}',
      );
    }
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool reachedEndOfQuiz() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}

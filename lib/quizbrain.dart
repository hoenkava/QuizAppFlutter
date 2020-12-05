import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBucket = [
    Question(
        'A constructor cannot throw any exception. It must handle all the exception itself using try catch block.',
        false),
    Question('All the methods declared in an interface are implicitly public.',
        true),
    Question('All the interfaces implicitly extends the Object class.', false),
    Question('A class constructor cannot be private.', false),
    Question(
        'A constructor can be declared as private. However, in this case, the object of the class cannot be created from outside the class as private constructor will not be accessible.',
        true),
    Question(
        'The wait and notify methods are defined by the Object class.', true),
    Question('A final class can be abstract.', false),
    Question(
        'A subclass must implement all the abstract methods declared by its parent abstract class.',
        false),
    Question(
        'A variable declared by an interface can be changed by the class implementing it.',
        false),
    Question('Java compiler always provides the default constructor.', false),
    Question(
        'In Java The default constructor is provided only if the class does not define any constructor(s).',
        true),
    Question('A final method cannot be overloaded.', false),
    Question(
        'A subclass must implement all the abstract methods of the parent abstract class or it can declare itself as an abstract.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'A final method cannot be overridden in the subclass. However, it can be overloaded.',
        true),
    Question('An interface cannot define an inner class.', true),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBucket.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBucket[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBucket[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBucket.length - 1) {
      return true;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}

import 'package:flutter/foundation.dart';
import 'package:hackathon_app/models/answer.dart';

class IntroQuestion {
  String id;
  String questionTitle;
  double sortScore;
  List<Answer> answers;
  String answerType;

  IntroQuestion({
    @required this.id,
    @required this.questionTitle,
    @optional this.answers,
    @optional this.answerType,
  });
}

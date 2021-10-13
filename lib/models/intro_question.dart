import 'package:flutter/foundation.dart';
import 'package:hackathon_app/models/answer.dart';

class IntroQuestion {
  String id;
  String questionTitle;
  String questionDescription;
  double sortScore;
  List<Answer> answers;

  IntroQuestion({
    @required this.id,
    @required this.questionTitle,
    @required this.answers,
  });
}

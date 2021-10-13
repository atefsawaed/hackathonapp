import 'package:flutter/foundation.dart';
import 'package:hackathon_app/models/answer.dart';

class IntroQuestion {
  String id;
  String questionTitle;
  String questionDescription;
  double sortScore;
  List<String> categories;
  List<Answer> answers;

  IntroQuestion({
    @required this.id,
    @required this.questionTitle,
    @required this.questionDescription,
    @required this.categories,
    @required this.answers,
  });
}

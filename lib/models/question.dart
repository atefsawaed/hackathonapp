import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/models/answer.dart';

class Question {
  String id;
  String levelTitle;
  String questionTitle;
  String questionDescription;
  double sortScore;
  List<String> categories;
  List<String> filters;
  List<Answer> answers;

  Question({
    @required this.id,
    @required this.levelTitle,
    @required this.questionTitle,
    @required this.questionDescription,
    @required this.sortScore,
    @required this.categories,
    @required this.answers,
    @required this.filters,
  });
}

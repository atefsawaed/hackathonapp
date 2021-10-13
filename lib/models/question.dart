import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/models/answer.dart';

class Question {
  final String id;
  final String levelTitle;
  final String questionTitle;
  final String questionDescription;
  final int sortScore;
  final List<String> categories;
  final List<String> filters;
  final List<Answer> answers;

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

  Question.fromJson(Map<String, Object> json)
      : this(
            id: json['id'] as String,
            levelTitle: json['level_title'] as String,
            questionTitle: json['question_title'] as String,
            questionDescription: json['questionDescription'] as String,
            categories: json['categories'] != null ? List.from(json['categories']) : [],
            sortScore: json['sortNumber'] as int,
            filters: json['filters'] != null ? List.from(json['filters']) : [],
            answers: Answer.fromQuestionJson(json));
}

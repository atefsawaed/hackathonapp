import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Answer {
  String id;
  String answerTitle;
  List<String> tags;

  Answer({
    @required this.id,
    @required this.answerTitle,
    @required this.tags,
  });

  Answer.fromJson(Map<String, Object> json)
      : this(
            id: "", //json[''],
            answerTitle: json['value'],
            tags: json['tags'] != null ? List.from(json['tags']) : []);

  static List<Answer> fromQuestionJson(Map<String, Object> json) {
    List<Answer> answers = [];
    if (json['answer1'] != null) answers.add(Answer.fromJson(json['answer1']));
    if (json['answer2'] != null) answers.add(Answer.fromJson(json['answer2']));
    if (json['answer3'] != null) answers.add(Answer.fromJson(json['answer3']));
    if (json['answer4'] != null) answers.add(Answer.fromJson(json['answer4']));
    return answers;
  }
}

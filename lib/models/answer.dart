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
}

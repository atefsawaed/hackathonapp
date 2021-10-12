import 'package:flutter/foundation.dart';
import 'package:hackathon_app/models/question.dart';

class Category {
  String id;
  String name;
  String image;
  bool isActive;
  int completionStatus; // Number from 1-5

  List<Question> questions;

  Category({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.isActive,
    @required this.completionStatus,
    @required this.questions,
  });
}

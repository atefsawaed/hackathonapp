import 'package:hackathon_app/models/answer.dart';
import 'package:hackathon_app/models/question.dart';

// Bank category
Answer banking_q1_a1 = Answer(
  id: "banking_q1_a1",
  answerTitle: "כן",
  tags: ["banking", "saving"],
);

Answer banking_q1_a2 = Answer(
  id: "banking_q1_a2",
  answerTitle: "לא",
  tags: ["education", "no_banking"],
);

Question banking_q1 = Question(
  id: "banknig_q1",
  levelTitle: "חסכון פנסיוני",
  questionTitle: "האם אתם חוסכים לפנסיה?",
  questionDescription: "תיאור השאלה",
  categories: ["bank"],
  sortScore: 9,
  filters: ["filter_1, filter_2"],
  answers: [banking_q1_a1, banking_q1_a2], // From above
);

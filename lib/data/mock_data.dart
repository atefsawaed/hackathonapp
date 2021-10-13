import 'package:hackathon_app/models/answer.dart';
import 'package:hackathon_app/models/category.dart';
import 'package:hackathon_app/models/question.dart';

// Bank category
Category banking_category = Category(
    id: "banking_category",
    image: "assets/icons/icons8-bank-building-48.png",
    name: "בנקים",
    isActive: true,
    questions: [banking_q1, banking_q2],
    completionStatus: 4);

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
  questionDescription:
      "תיאור לךשגכחעךלףגשכעחלךףגכדחיעלךףדכגחילךףגכחנלךדכגחידכךחעיךלדחכעיךלףחדכלךעחילךףכדעחיךףלדכעיחדכךףעלחיךדלכעח",
  categories: ["bank"],
  sortScore: 9,
  filters: ["filter_1, filter_2"],
  answers: [banking_q1_a1, banking_q1_a2], // From above
);

// Question 2

Answer banking_q2_a1 = Answer(
  id: "banking_q2_a1",
  answerTitle: "כן",
  tags: ["banking", "saving"],
);

Answer banking_q2_a2 = Answer(
  id: "banking_q2_a2",
  answerTitle: "לא",
  tags: ["education", "no_banking"],
);

Answer banking_q2_a3 = Answer(
  id: "banking_q2_a3",
  answerTitle: "סבבה",
  tags: ["education", "no_banking"],
);

Answer banking_q2_a4 = Answer(
  id: "banking_q2_a4",
  answerTitle: "לא יודע",
  tags: ["education", "no_banking"],
);

Question banking_q2 = Question(
  id: "banknig_q2",
  levelTitle: "סוג חשבון",
  questionTitle: "האם אתם מודעים לריביות ועמלות הקיימות במשכנתא?",
  questionDescription:
      "asdfasfdaflkgjsdfkljghklsdfjghklsdjglk;adfjhglk;sdfjhklfsgnbmklsfdgbnfgbfg\n\n\nlk;adjfgkljdflkgjdflkjghfslkjhlkdfsjh",
  categories: ["bank"],
  sortScore: 9,
  filters: ["filter_1, filter_2"],
  answers: [
    banking_q2_a1,
    banking_q2_a2,
    banking_q2_a3,
    banking_q2_a4
  ], // From above
);

// Other categories

Category bank_card_category = Category(
    id: "bank_card_category",
    image: "assets/icons/icons8-bank-cards-48.png",
    name: "כרטיסי אשראי",
    isActive: true,
    questions: [],
    completionStatus: 3);

Category mortgage_category = Category(
    id: "mortgage_category",
    image: "assets/icons/icons8-property-48.png",
    name: "משכנתא",
    isActive: true,
    questions: [],
    completionStatus: 2);

Category stocks_category = Category(
    id: "stocks_category",
    image: "assets/icons/icons8-stocks-48.png",
    name: "מניות",
    isActive: false,
    questions: [],
    completionStatus: 1);

Category payslip_category = Category(
    id: "payslip_category",
    image: "assets/icons/icons8-tips-48.png",
    name: "תלוש משכורת",
    isActive: false,
    questions: [],
    completionStatus: 0);

// Category foreign_exchange_category = Category(
//     id: "foreign_exchange_category",
//     image: "assets/icons/icons8-money-box-48.png",
//     name: "חסכון לכל ילד",
//     isActive: true,
//     questions: [],
//     completionStatus: 0);

Category kopat_gemel_category = Category(
    id: "kopat_gemel_category",
    image: "assets/icons/icons8-money-box-48.png",
    name: "קופת גמל להשקעה",
    isActive: false,
    questions: [],
    completionStatus: 0);

Category maternity_leave_category = Category(
    id: "maternity_leave_category",
    image: "assets/icons/icons8-mother's-health-48.png",
    name: "חופשת לידה",
    isActive: false,
    questions: [],
    completionStatus: 0);

Category nitzul_shuaa_category = Category(
    id: "nitzul_shuaa_category",
    image: "assets/icons/icons8-elderly-person-48.png",
    name: "ניצולי שואה",
    isActive: false,
    questions: [],
    completionStatus: 0);

Category life_insurance_category = Category(
    id: "life_insurance_category",
    image: "assets/icons/icons8-heart-health-48.png",
    name: "ביטוח בריאות",
    isActive: false,
    questions: [],
    completionStatus: 0);

Category car_insurance_category = Category(
    id: "car_insurance_category",
    image: "assets/icons/icons8-car-insurance-48.png",
    name: "ביטוח רכב",
    isActive: false,
    questions: [],
    completionStatus: 0);
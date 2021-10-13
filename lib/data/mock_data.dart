import 'package:hackathon_app/models/answer.dart';
import 'package:hackathon_app/models/category.dart';
import 'package:hackathon_app/models/question.dart';

// Bank category
Category banking_category = Category(
    id: "banking_category",
    image: "assets/icons/icons8-bank-building-48.png",
    name: "חשבון בנק",
    isActive: true,
    questions: [banking_q1, banking_q2, banking_q3],
    completionStatus: 4);

Answer banking_q1_a1 = Answer(
  id: "banking_q1_a1",
  answerTitle: "כן",
  tags: ["bank_tag1"]
);

Answer banking_q1_a2 = Answer(
  id: "banking_q1_a2",
  answerTitle: "דלג",
  tags: ["bank_tag1"]
);

Question banking_q1 = Question(
  id: "banknig_q1",
  levelTitle: "סיווג חשבון",
  questionTitle: "האם סיווג החשבון שלך תואם את סטטוס החיים?",
  questionDescription:
      "סיווג חשבון לפי סטטוס מאפשר לכם להנות מהטבות ותנאים מותאמות לסטטוס. לעיתים זה עשוי להיות משמעותי מבחינת עמלות והטבות. יש לוודא שסיווג החשבון תואם את סטטוס החיים ויש לעדכנו מדי פעם. ",
  categories: ["bank"],
  sortScore: 10,
  filters: [],
  answers: [banking_q1_a1, banking_q1_a2], // From above
);

// Question 2

Answer banking_q2_a1 = Answer(
  id: "banking_q2_a1",
  answerTitle: "כן",
  tags: ["bank_tag2"]
);

Answer banking_q2_a2 = Answer(
  id: "banking_q2_a2",
  answerTitle: "דלג",
  tags: ["bank_tag2"]
);

Question banking_q2 = Question(
  id: "banknig_q2",
  levelTitle: "הקצאת מסגרת אשראי",
  questionTitle: "האם מסגרת האשראי שלך תואמת את הצרכים? ",
  questionDescription:
      "הקצאת מסגרת אשראי לעיתים כרוחה בעלויות של ריבית ועמלה. כשאין צורך, מומלץ למזער. מצד שני, לעיתים צפויות הוצאות גדולות ובשביל להימנע מעלויות ריבית גבוהות יש להגדיר מסגרת אשראי מתאימה עם הבנק מבעוד מועד. ",
  categories: ["bank"],
  sortScore: 20,
  filters: ["bank_tag1"],
  answers: [banking_q2_a1, banking_q2_a2], // From above
);

// Question 3

Answer banking_q3_a1 = Answer(
  id: "banking_q3_a1",
  answerTitle: "כן",
);

Answer banking_q3_a2 = Answer(
  id: "banking_q3_a2",
  answerTitle: "דלג",
);

Question banking_q3 = Question(
  id: "banknig_q3",
  levelTitle: "עמלות",
  questionTitle: "האם קיבלת אם הטבת העמלות הטובה ביותר עבורך?",
  questionDescription:
      "ניהול חשבון בנק כולל במקרים רבים עמלות שונות ומגוונות. בהתאם לסטטוס ובעיקר בהתאם לגודל המשכורת/ות הנכנסות, ניתן לקבל הנחות משמעותיות בעמלות, ואף להגיע לחשבון ללא עמלות בכלל. בכל מקרה יש לבדוק מדי שנה את עלויות העמלות ולברר עם הבנקאי איפה ניתן להוזיל. בשביל לראות בצורה הטובה ביותר סיכום של תשלומי העמלות, ניתן להוציא (אפילו דרך האינטרנט) טופס שנקרא ת.ז. בנקאית ושם ניתן לראות ריכוז של כל תשלומי העמלות. ",
  categories: ["bank"],
  sortScore: 30,
  filters: ["bank_tag1", "bank_tag2"],
  answers: [banking_q3_a1, banking_q3_a2], // From above
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

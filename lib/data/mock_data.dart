import 'package:hackathon_app/models/action_item.dart';
import 'package:hackathon_app/models/answer.dart';
import 'package:hackathon_app/models/category.dart';
import 'package:hackathon_app/models/intro_question.dart';
import 'package:hackathon_app/models/question.dart';

// Bank category
Category banking_category = Category(
    id: "banking_category",
    image: "assets/icons/icons8-bank-building-48.png",
    name: "חשבון בנק",
    isActive: true,
    questions: [
      // intro_q2,
      // intro_q3,
      banking_q1,
      banking_q2,
      banking_q3,
      banking_q4
    ],
    completionStatus: 0);

Answer banking_q1_a1 =
    Answer(id: "banking_q1_a1", answerTitle: "כן", tags: ["bank_tag1"]);

Answer banking_q1_a2 =
    Answer(id: "banking_q1_a2", answerTitle: "לא", tags: ["bank_tag1"]);

Question banking_q1 = Question(
  id: "banknig_q1",
  levelTitle: "סיווג חשבון",
  questionTitle: "האם סיווג החשבון שלך תואם את סטטוס החיים?",
  questionDescription:
      "סיווג חשבון לפי סטטוס מאפשר לכם להנות מהטבות ותנאים מותאמות לסטטוס. לעיתים זה עשוי להיות משמעותי מבחינת עמלות והטבות. יש לוודא שסיווג החשבון תואם את סטטוס החיים ויש לעדכנו מדי פעם. ",
  categories: ["bank"],
  sortScore: 10,
  filters: [],
  answers: [
    banking_q1_a1,
    banking_q1_a2,
  ], // From above
);

// Question 2

Answer banking_q2_a1 =
    Answer(id: "banking_q2_a1", answerTitle: "כן", tags: ["bank_tag2"]);

Answer banking_q2_a2 =
    Answer(id: "banking_q2_a2", answerTitle: "לא", tags: ["bank_tag2"]);

Question banking_q2 = Question(
  id: "banknig_q2",
  levelTitle: "הקצאת מסגרת אשראי",
  questionTitle: "האם מסגרת האשראי שלך תואמת את הצרכים? ",
  questionDescription:
      "הקצאת מסגרת אשראי לעיתים כרוכה בעלויות של ריבית ועמלה. כשאין צורך, מומלץ למזער. מצד שני, לעיתים צפויות הוצאות גדולות ובשביל להימנע מעלויות ריבית גבוהות יש להגדיר מסגרת אשראי מתאימה עם הבנק מבעוד מועד. ",
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
  answerTitle: "לא",
);

Question banking_q3 = Question(
  id: "banknig_q3",
  levelTitle: "עמלות",
  questionTitle: "האם קיבלת את הטבת העמלות הטובה ביותר עבורך?",
  questionDescription:
      "ניהול חשבון בנק כולל במקרים רבים עמלות שונות ומגוונות. בהתאם לסטטוס ובעיקר בהתאם לגודל המשכורת/ות הנכנסות, ניתן לקבל הנחות משמעותיות בעמלות, ואף להגיע לחשבון ללא עמלות בכלל.",
  categories: ["bank"],
  sortScore: 30,
  filters: ["bank_tag1", "bank_tag2"],
  answers: [banking_q3_a1, banking_q3_a2], // From above
);

// Summary 1

Question banking_q4 = Question(
  id: "banknig_s1",
  levelTitle: "סיימנו",
  questionTitle: "לא לשכוח לחזור לבדיקה במקרה של מעבר בנק",
  questionDescription:
      "**מושלם!** עכשיו אפשר להיות רגועים שחשבון הבנק מתנהל בצורה אופטימלית.",
  categories: ["bank"],
  sortScore: 40,
  filters: ["bank_tag1", "bank_tag2"],
  answers: [], // From above
);

// Credit Card Category

Category credit_card_category = Category(
    id: "credit_card_category",
    image: "assets/icons/icons8-bank-cards-48.png",
    name: "כרטיסי אשראי",
    isActive: true,
    questions: [cc_q1, cc_q2, cc_s1, cc_s2],
    completionStatus: 0);

// Question 1

Answer cc_q1_a1 = Answer(
  id: "cc_q1_a1",
  answerTitle: "כן",
);

Answer cc_q1_a2 = Answer(
  id: "cc_q1_a2",
  answerTitle: "לא",
);

Question cc_q1 = Question(
  id: "cc_q1",
  levelTitle: "דמי שימוש",
  questionTitle: "האם יש חיוב של דמי שימוש באחד מכרטיסי האשראי שברשותך?",
  questionDescription:
      "כרטיסי אשראי לרוב מונפקים בהתחלה ללא דמי שימוש חודשיים, אבל לעיתים ביטול דמי השימוש מוגבל מראש לשנה, וכעבור שנה מתחילים להופיע חיובים של דמי שימוש. יש לבדוק לפחות אחת לרבעון שאין חיוב של דמי שימוש בכל כרטיסי האשראי. ",
  categories: ["cc"],
  sortScore: 20,
  filters: ["cc_tag1", "cc_tag2"],
  answers: [
    cc_q1_a1,
    cc_q1_a2,
  ], // From above
);

// Question 2

Answer cc_q2_a1 = Answer(
  id: "cc_q2_a1",
  answerTitle: "כן",
);

Answer cc_q2_a2 = Answer(
  id: "cc_q2_a2",
  answerTitle: "לא",
);

Answer cc_q2_a3 = Answer(
  id: "cc_q2_a3",
  answerTitle: "אינני מבצעת רכישות במט" "ח",
);

Question cc_q2 = Question(
  id: "cc_q2",
  levelTitle: "עמלות מט" "ח",
  questionTitle:
      "האם ידועים לך דמי עמלת המרת המט" "ח בכל כרטיסי האשראי שברשותך?",
  questionDescription: "כאשר מתבצעות רכישות במט"
      "ח בכרטיסי אשראי, חברת האשראי עלולה לגבות עמלה. עמלה זו מתבטאת באחוז מסכום העסקה, ולכן במקרה של רכישה גדולה זה עלול להיות משמעותי. ",
  categories: ["cc"],
  sortScore: 30,
  filters: ["cc_tag1", "cc_tag2"],
  answers: [
    cc_q2_a1,
    cc_q2_a2,

    // cc_q2_a3,
  ], // From above
);

// Summary 1

Question cc_s1 = Question(
  id: "cc_s1",
  levelTitle: "יש לנו הצעות",
  questionTitle: "",
  questionDescription:
      "**יש לפעול לביטול דמי השימוש החודשיים בכרטיס האשראי**. ברוב המקרים ניתן לבטל לחלוטין את דמי השימוש על ידי פנייה לחברת האשראי בבקשה לביטול דמי השימוש. במקרים אחרים ניתן פשוט לבטל את הכרטיס ולהנפיק כרטיס חדש. ",
  categories: ["cc"],
  sortScore: 40,
  filters: ["cc_tag1", "cc_tag2"],
  answers: [Answer(id: "cc_s1_a1", answerTitle: "מעולה!")], // From above
);

// Summary 2

Question cc_s2 = Question(
  id: "cc_s2",
  levelTitle: "יש לנו הצעות",
  questionTitle: "",
  questionDescription: "**יש לפעול להשגת הטבת 0% עמלת מט"
      "ח בכרטיס אשראי ושימוש בכרטיס זה לרכישות במט"
      "ח**. במקרים רבים ניתן להגיע להסדר של 0% עמלת מט"
      "ח בכרטיס אשראי על ידי שיחת טלפון לנציגי השרות. ",
  categories: ["cc"],
  sortScore: 50,
  filters: ["cc_tag1", "cc_tag2"],
  answers: [Answer(id: "cc_s2_a1", answerTitle: "אחלה!")], // From above
);

Category mortgage_category = Category(
    id: "mortgage_category",
    image: "assets/icons/icons8-property-48.png",
    name: "משכנתא",
    isActive: false,
    questions: [],
    completionStatus: 3);

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
    completionStatus: 1);

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
    name: "גמל להשקעה",
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

Category children_savings_category = Category(
    id: "children_savings_category",
    image: "assets/icons/give-money-2.png",
    name: "חסכון לכל ילד",
    isActive: false,
    questions: [],
    completionStatus: 0);

ActionItem ai1 = ActionItem(
    id: "ai1",
    title: "המלצה מספר 1",
    description:
        "המלצה המלצה טקסט המצלה המלצה המלצה טקסט המצלההמלצה המלצה טקסט המצלההמלצה המלצה טקסט המצלההמלצה המלצה טקסט המצלההמלצה המלצה טקסט המצלה");

ActionItem ai2 = ActionItem(
    id: "ai2",
    title: "המלצה מספר 2",
    description:
        "המלצה המלצה טקסט המצלה המלצה המלצה טקסט המצלההמלצה המלצה טקסט המצלההמלצה המלצה טקסט המצלההמלצה המלצה טקסט המצלההמלצה המלצה טקסט המצלה");

// Introduction Questions
IntroQuestion intro_q1 = IntroQuestion(
  id: "intro_q1",
  questionTitle: "?מהי שנת הלידה שלך",
  // answerType: YearSelector,
);

Answer intro_q2_a1 = Answer(
  id: "intro_q2_a1",
  answerTitle: "רווק",
  tags: ["bachelor"],
);

Answer intro_q2_a2 = Answer(
  id: "intro_q2_a2",
  answerTitle: "נשוי או ידוע בציבור",
  tags: ["married"],
);

Answer intro_q2_a3 = Answer(
  id: "intro_q2_a3",
  answerTitle: "אלמן",
  tags: ["widower"],
);

Question intro_q2 = Question(
    id: "intro_q2",
    levelTitle: "",
    questionTitle: "מה המצב המשפחתי שלך?",
    questionDescription: "",
    answers: [intro_q2_a1, intro_q2_a2, intro_q2_a3]);

Answer intro_q3_a1 = Answer(
  id: "intro_q3_a1",
  answerTitle: "יש ילדים עד גיל 18",
  tags: ["has_young_children"],
);

Answer intro_q3_a2 = Answer(
  id: "intro_q3_a2",
  answerTitle: "כל הילדים מעל גיל 18",
  tags: ["has_old_children"],
);

Answer intro_q3_a3 = Answer(
  id: "intro_q3_a3",
  answerTitle: "אין לי ילדים",
  tags: ["no_children"],
);

Question intro_q3 = Question(
    levelTitle: "",
    id: "intro_q3",
    questionDescription: "",
    questionTitle: "האם יש לך ילדים?",
    answers: [intro_q3_a1, intro_q3_a2, intro_q3_a3]);

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hackathon_app/models/category.dart';
import 'package:hackathon_app/models/question.dart';
import 'package:hackathon_app/utils/size_config.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 15.0;

class QuestionPage extends StatefulWidget {
  // final String categoryName;
  // final List<Question> questions;
  // final String image;

  final Category category;

  const QuestionPage({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
    // var answeredTags = HashSet<String>();
    // answeredTags.add("bank_tag1");
    // answeredTags.add("bank_tag2");
    // answeredTags.add("other");
    // var result = getNextQuestion(widget.category, 0, answeredTags);
    // List<Question> questions = result[0];
    // int lastQuestionIndex = result[1];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  void _onIntroEnd(context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => HomeScreen()),
    // );
  }

  Widget _buildImage(String assetName, double width) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: width),
      alignment: Alignment.bottomCenter,
    );
  }

  bool isQuestionAnswered(Question question) {
    // TODO: implement this
    return false;
  }

  List getNextQuestion(
      Category category, int currentQuestion, HashSet<String> answeredTags) {
    List<Question> questions = [];
    int lastQuestion = currentQuestion + 1;
    for (var i = lastQuestion; i < category.questions.length; i++) {
      var question = category.questions[i];
      if (questions.isNotEmpty &&
          questions.last.sortScore != question.sortScore) {
        // We assume that all questions in the list are sorted by sortScore.
        // If the next question's sortScore differs, it means that we have no more questions to add
        break;
      }

      if (isQuestionAnswered(question))
        continue; // Don't show already answered question

      if (answeredTags.containsAll(question.filters)) {
        questions.add(question);
        lastQuestion = i;
      }
    }
    return [questions, lastQuestion];
  }

  PageViewModel QuestionView(PageDecoration pageDecoration, int index) {
    return PageViewModel(
      // title: widget.category.questions[index].questionTitle,
      titleWidget: Container(),
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 25,
                      child: Text(
                        widget.category.questions[index].levelTitle,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 80,
                      child: Text(
                        widget.category.questions[index].questionTitle,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 50),
                    child: Center(
                      child: Container(
                        height: 200,
                        child: Markdown(data: widget.category.questions[index].questionDescription),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            height: 370,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ...List.generate(
                  widget.category.questions[index].answers.length,
                  (i) => AnswerOption(
                    index: i,
                    text:
                        widget.category.questions[index].answers[i].answerTitle,
                    press: () {
                      introKey.currentState.controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      // TODO: Handle last question
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: pageDecoration,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0),
      pageColor: Colors.transparent,
      titlePadding: EdgeInsets.only(bottom: 10),
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.grey[600]),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   actionsIconTheme: IconThemeData(color: Colors.black),
      //   centerTitle: true,
      //   title: Row(
      //     children: [
      //       Image.asset(widget.category.image, height: 40),
      //       SizedBox(width: 5),
      //       Text(
      //         widget.category.name,
      //         style: TextStyle(
      //             fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
      //             color: Colors.black),
      //       ),
      //     ],
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/question_background.svg',
            alignment: Alignment.center,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: IntroductionScreen(
              globalBackgroundColor: Colors.transparent,
              key: introKey,
              pages: [
                for (int i = 0; i < widget.category.questions.length; i++)
                  QuestionView(pageDecoration, i),
              ],
              onDone: () => _onIntroEnd(context),
              showSkipButton: false,
              showNextButton: false,
              skipFlex: 0,
              nextFlex: 0,
              next: const Icon(Icons.arrow_forward),
              done: const Text('סיום',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.blueGrey)),
              dotsDecorator: const DotsDecorator(
                activeColor: Colors.blueGrey,
                size: Size(10.0, 10.0),
                color: Color(0xFFBDBDBD),
                activeSize: Size(22.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    // constraints: BoxConstraints(
                    //   minHeight: 25,
                    // ),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 22,
                    ),
                    onPressed: () {
                      print("Here");
                      Navigator.of(context).pop();
                    }),
                // Image.asset(widget.category.image, height: 40),
                // SizedBox(width: 3),
                // Text(
                //   widget.category.name,
                //   style: TextStyle(
                //       fontFamily:
                //           Theme.of(context).textTheme.headline6.fontFamily,
                //       color: Colors.black,
                //       fontSize: 18),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    Key key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      // child: Container(
      //   width: 250,
      //   height: 65,
      //   margin: EdgeInsets.only(top: kDefaultPadding),
      //   padding: EdgeInsets.all(kDefaultPadding),
      //   decoration: BoxDecoration(
      //     border: Border.all(color: Colors.black87),
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(15),
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(3, 3),
      //         blurRadius: 4,
      //         color: Colors.grey[300],
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         "${index + 1}. $text",
      //         style: TextStyle(color: Colors.black87, fontSize: 18),
      //       ),
      //       // Container(
      //       //   height: 26,
      //       //   width: 26,
      //       //   decoration: BoxDecoration(
      //       //     color: Colors.transparent,
      //       //     borderRadius: BorderRadius.circular(50),
      //       //     border: Border.all(color: Colors.green),
      //       //   ),
      //       //   child: Icon(Icons.done, size: 16),
      //       // )
      //     ],
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: AnimatedButton(
            borderRadius: 12,
            enable: true,
            width: 200,
            text: text,
            onPress: () async {
              Future.delayed(Duration(milliseconds: 500), () {
                press();
              });
            },
            backgroundColor: Colors.white,
            selectedTextColor: Colors.white,
            transitionType: TransitionType.RIGHT_CENTER_ROUNDER,
            selectedBackgroundColor: Colors.green,
            animationDuration: Duration(milliseconds: 300),
            textStyle: TextStyle(
                fontSize: 28,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}

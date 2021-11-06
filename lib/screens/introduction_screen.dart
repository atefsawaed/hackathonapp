import 'package:flutter/material.dart';
import 'package:hackathon_app/data/mock_data.dart';
import 'package:hackathon_app/models/question.dart';
import 'package:hackathon_app/utils/size_config.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future setFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('initScreen', true);
  }

  void _onIntroEnd(context) {
    setFirstSeen();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Widget _buildImage(String assetName, double width) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: width),
      alignment: Alignment.bottomCenter,
    );
  }

  PageViewModel QuestionView(
      PageDecoration pageDecoration, Question question, bool last) {
    return PageViewModel(
      titleWidget: Container(),
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Center(
                  //   child: Container(
                  //     height: 30,
                  //     child: Text(
                  //       question.levelTitle,
                  //       style: TextStyle(
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.blueGrey),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 30),
                    child: Container(
                      height: 100,
                      child: Text(
                        question.questionTitle,
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  ...List.generate(
                    question.answers.length,
                    (i) => AnswerOption(
                      index: i,
                      text: question.answers[i].answerTitle,
                      press: () async {
                        if (last) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                          );
                        } else {
                          introKey.currentState.controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                    ),
                  ),
                ],
              )),
          // Container(
          //   height: 200,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //
          //     ],
          //   ),
          // ),
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
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "התנהלות כלכלית נכונה",
          body: "למדו איך להתנהל כלכלית בצורה מהנה ומותאמת עבורכם!",
          image: _buildImage('intro_1', 270),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "קבלו את מה שמגיע לכם",
          body: "למדו היטב על הזכויות שלכן ואיך למצוא אותן",
          image: _buildImage('intro_2', 180),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "המלצות מותאמות אישית!",
          body:
              "על פי המידע שנקבל מכם, אנו נתאים עבורכם המלצות שיעזרו לכם להתנהל כלכלית!",
          image: _buildImage('intro_3', 250),
          decoration: pageDecoration,
        ),
        QuestionView(pageDecoration, intro_q2, false),
        QuestionView(pageDecoration, intro_q3, true),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      skip: Text("דלג", style: TextStyle(color: Colors.black)),

      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      // skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('יאללה אני מוכן!',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.lightBlue)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
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
        padding: const EdgeInsets.symmetric(vertical: 5),
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
            borderColor: Colors.black,
            borderWidth: 1,
            backgroundColor: Colors.white,
            selectedTextColor: Colors.white,
            transitionType: TransitionType.RIGHT_CENTER_ROUNDER,
            selectedBackgroundColor: Colors.green,
            animationDuration: Duration(milliseconds: 300),
            textStyle: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}

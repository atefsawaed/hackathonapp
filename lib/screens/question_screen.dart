import 'package:flutter/material.dart';
import 'package:hackathon_app/models/category.dart';
import 'package:hackathon_app/models/question.dart';
import 'package:hackathon_app/utils/size_config.dart';
import 'package:hackathon_app/widgets/page_header.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

const double kDefaultPadding = 20.0;

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

  PageViewModel QuestionView(PageDecoration pageDecoration, int index) {
    return PageViewModel(
      // title: widget.questions[index].questionTitle,
      titleWidget: Container(),
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Container(
                        height: 200,
                        child: Text(
                          widget.category.questions[index].questionDescription,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[800]),
                        ),
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[600]),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actionsIconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(widget.category.image, height: 40),
            SizedBox(width: 5),
            Text(
              widget.category.name,
              style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
                  color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
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
          IntroductionScreen(
            globalBackgroundColor: Colors.transparent,
            key: introKey,
            pages: [
              for (int i = 0; i < widget.category.questions.length; i++)
                QuestionView(pageDecoration, i),
            ],
            onDone: () => _onIntroEnd(context),
            showSkipButton: true,
            showNextButton: false,
            skipFlex: 0,
            skip: Text("דלג", style: TextStyle(color: Colors.black)),
            nextFlex: 0,
            next: const Icon(Icons.arrow_forward),
            done: const Text('סיום',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.blueAccent)),
            dotsDecorator: const DotsDecorator(
              activeColor: Colors.blueAccent,
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
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
      child: Container(
        width: 300,
        margin: EdgeInsets.only(top: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 4,
              color: Colors.grey[300],
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1}. $text",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
            // Container(
            //   height: 26,
            //   width: 26,
            //   decoration: BoxDecoration(
            //     color: Colors.transparent,
            //     borderRadius: BorderRadius.circular(50),
            //     border: Border.all(color: Colors.green),
            //   ),
            //   child: Icon(Icons.done, size: 16),
            // )
          ],
        ),
      ),
    );
  }
}

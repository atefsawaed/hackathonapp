import 'package:flutter/material.dart';
import 'package:hackathon_app/models/action_item.dart';
import 'package:hackathon_app/screens/home_screen.dart';
import 'package:hackathon_app/utils/size_config.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slimy_card/slimy_card.dart';

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

class ActionItemScreen extends StatefulWidget {
  final List<ActionItem> actionItems;

  const ActionItemScreen({
    Key key,
    @required this.actionItems,
  }) : super(key: key);

  @override
  _ActionItemScreenState createState() => _ActionItemScreenState();
}

class _ActionItemScreenState extends State<ActionItemScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
    // int lastQuestionIndex = result[1];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  void _onIntroEnd(context) {
    // Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  PageViewModel QuestionView(PageDecoration pageDecoration, int index) {
    return PageViewModel(
      titleWidget: Container(),
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                SlimyCard(
                  color: Colors.lightGreen,
                  width: 400,
                  topCardHeight: 450,
                  bottomCardHeight: 200,
                  borderRadius: 15,
                  topCardWidget: topCardWidget(
                      widget.actionItems[index].title,
                      widget.actionItems[index].description,
                      "assets/images/person_saving.png"),
                  bottomCardWidget:
                      bottomCardWidget(widget.actionItems[index].title),
                  slimeEnabled: true,
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
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/question_background.svg',
            alignment: Alignment.bottomLeft,
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
                for (int i = 0; i < widget.actionItems.length; i++)
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
                activeSize: Size(10.0, 10.0),
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
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 22,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (_) => HomeScreen()),
                      // );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// This widget will be passed as Top Card's Widget.
Widget topCardWidget(String title, String description, String imagePath) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      // Container(
      //   height: 70,
      //   width: 70,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(15),
      //     image: DecorationImage(image: AssetImage(imagePath)),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.1),
      //         blurRadius: 20,
      //         spreadRadius: 1,
      //       ),
      //     ],
      //   ),
      // ),
      SizedBox(height: 15),
      Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 27,
        ),
      ),
      SizedBox(height: 15),
      Text(
        description,
        style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 17,
            fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10),
    ],
  );
}

// This widget will be passed as Bottom Card's Widget.
Widget bottomCardWidget(String) {
  return Text(
    'לינק 1 לינק 2 לינק 3 ... עוד ',
    style: TextStyle(
      color: Colors.blueGrey,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    textAlign: TextAlign.center,
  );
}

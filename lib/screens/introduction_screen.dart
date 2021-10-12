import 'package:flutter/material.dart';
import 'package:hackathon_app/utils/size_config.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
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
          body: "תלמדו היטב על הזכויות שלכן ואיך למצוא אותן",
          image: _buildImage('intro_2', 180),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "המלצות מותאמות אישית!",
          body:
              "על פי המידע שנקבל מכם, אנו נתאים עבורכם המלצות שיעזרו לכן להתנהל כלכלית!",
          image: _buildImage('intro_3', 250),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_app/data/mock_data.dart';
import 'package:hackathon_app/screens/action_items_screen.dart';
import 'package:hackathon_app/screens/home_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingAIScreen extends StatefulWidget {
  @override
  _LoadingAIScreenState createState() => _LoadingAIScreenState();
}

class _LoadingAIScreenState extends State<LoadingAIScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) => nextPage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  nextPage() async {
    Route route = MaterialPageRoute(
        builder: (context) => ActionItemScreen(actionItems: [ai1, ai2]));
    Navigator.pushReplacement(context, route);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => ActionItemScreen(actionItems: [ai1, ai2])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Positioned(
            top: 90,
            right: 30,
            child: Text(
              "אנחנו מכינים לך את ההמלצות.. ",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 5,
            width: 400,
            height: 400,
            child: Image.asset("assets/images/cyborg-117.png"),
          ),
          Center(
            child: Container(
              width: 100,
              height: 100,
              child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  color: Colors.pinkAccent),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_app/data/mock_data.dart';
import 'package:hackathon_app/models/category.dart';
import 'package:hackathon_app/screens/question_screen.dart';

import 'package:hackathon_app/utils/constants.dart';
import 'package:hackathon_app/widgets/page_header.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  Widget categoryGridItem(BuildContext context, Category category) {
    return GestureDetector(
      child: SubcategoryCard(
        image: category.image,
        title: category.name,
        isActive: true,
        progress: category.completionStatus,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => QuestionPage(
              category: category,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/images/sammy-finance.png",
              textTop: "כל מה שאתם צריכים",
              textBottom: "להתנהלות כלכלית נכונה.",
              offset: offset,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    addRepaintBoundaries: false,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 3,
                    children: [
                      categoryGridItem(context, banking_category),
                      categoryGridItem(context, bank_card_category),
                      categoryGridItem(context, mortgage_category),
                      categoryGridItem(context, stocks_category),
                      categoryGridItem(context, bonds_category),
                      categoryGridItem(context, foreign_exchange_category),
                      categoryGridItem(context, savings_category),
                      categoryGridItem(context, life_insurance_category),
                      categoryGridItem(context, car_insurance_category),

                      // SubcategoryCard(
                      //   image: "assets/icons/icons8-bank-cards-48.png",
                      //   title: "כרטיסי אשראי",
                      //   isActive: true,
                      // ),
                      // SubcategoryCard(
                      //   image: "assets/icons/icons8-property-48.png",
                      //   title: "משכנתא",
                      //   isActive: true,
                      // ),
                      // SubcategoryCard(
                      //   image: "assets/icons/icons8-stocks-48.png",
                      //   title: "מניות",
                      //   isActive: true,
                      // ),
                      // SubcategoryCard(
                      //   image: "assets/icons/icons8-bonds-48.png",
                      //   title: "אג״ח",
                      //   isActive: true,
                      // ),
                      // SubcategoryCard(
                      //   image: "assets/icons/icons8-bank-euro-48.png",
                      //   title: "מט״ח",
                      //   isActive: true,
                      // ),
                      // SubcategoryCard(
                      //   image: "assets/icons/icons8-money-box-48.png",
                      //   title: "חסכונות",
                      //   isActive: true,
                      // ),
                      // SubcategoryCard(
                      //   image: "assets/icons/icons8-heart-health-48.png",
                      //   title: "ביטוח בריאות",
                      //   isActive: true,
                      // ),
                      // SubcategoryCard(
                      //   image: "assets/icons/icons8-car-insurance-48.png",
                      //   title: "ביטוח רכב",
                      //   isActive: true,
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                // CategoryCard(
                //   text: "טקסט",
                //   image: "assets/icons8-bank-account-48.png",
                //   title: "נושא",
                // ),

                SizedBox(height: 50),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(title, style: kSubTextStyle),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const CategoryCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubcategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final int progress;
  const SubcategoryCard({
    Key key,
    this.image,
    this.title,
    this.progress,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 14,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image, height: 50),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          CircularStepProgressIndicator(
            currentStep: progress, // FILL HERE
            totalSteps: 5,
            stepSize: 5,
            selectedColor: Colors.greenAccent,
            unselectedColor: Colors.grey[200],
            padding: 0,
            width: 20,
            height: 20,
            selectedStepSize: 5,
            roundedCap: (_, __) => true,
          ),
        ],
      ),
    );
  }
}

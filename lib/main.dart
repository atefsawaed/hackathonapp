import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_app/screens/home_screen.dart';
import 'package:hackathon_app/utils/constants.dart';
import 'screens/introduction_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool initScreen = prefs.getBool('initScreen');

  runApp(MyApp(initScreen));
}

class MyApp extends StatelessWidget {
  MyApp(bool initScreen) {
    initScreen = initScreen;
  }

  get initScreen => initScreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('he'),
      ],
      locale: const Locale('he'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      title: 'Hackathon App',
      theme: ThemeData(
        textTheme: GoogleFonts.alefTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initScreen == false ? "intro" : "home",
      routes: {
        "home": (context) => HomeScreen(),
        "intro": (context) => OnBoardingPage(),
      },
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}

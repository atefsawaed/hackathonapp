import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_app/utils/constants.dart';
import 'screens/introduction_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}

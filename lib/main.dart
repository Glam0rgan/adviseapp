import 'dart:io';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/Ctest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/SearchSubject.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/FindSchool.dart';
import 'splash.dart';
import 'package:flutter_survey/flutter_survey.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
        routes: {
          // "/":(context) => RootPage(),
          "CTest":(context) => CTestPage(),
          "FSchool":(context) => FindSchoolPage(),
          "SSubject":(context) => SearchSubjectPage(),
          "FAHS":(context) => FitnessAppHomeScreen(),
        },
      home: Splash(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_report_app/screens/home_page.dart';
import 'package:flutter_report_app/screens/report_page.dart';
import 'package:flutter_report_app/utils/router.dart';
import 'package:flutter_report_app/utils/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      title: 'Flutter Class Report',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        MyUrl.rootPage: (uri, params) => const MaterialPage(child: MyReport()),
        MyUrl.homePage: (uri, params) => const MaterialPage(child: HomePage()),
        MyUrl.reportPage: (uri, params) =>
            const MaterialPage(child: MyReport()),
      }),
    );
  }
}

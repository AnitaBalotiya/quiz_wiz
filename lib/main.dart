import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';
import 'helper/global.dart';
import 'helper/pref.dart';
import 'modules/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //enter full-screen
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await Hive.initFlutter().then((value) async => await Pref.initializeHive());

  //initialize firebase & then ads in config
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Activate app check
  await FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.debug);

  //for setting orientation to portrait only
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    //
    return GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,

        // theme
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Lato',

            // default appbar theme
            appBarTheme: const AppBarTheme(
                centerTitle: true,

                //
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black))),

        //
        home: const SplashScreen());
  }
}

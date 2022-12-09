import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdrunner/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'store_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:html' as html;
import 'dart:async';

Future main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StoreConfig currecntStore = StoreConfig.getStoreName();

  @override
  void initState() {
    super.initState();

    Timer mytimer = Timer.periodic(Duration(minutes: 2), (timer) {
      html.window.location.reload();
      print("Refreshing....");
    });

    // BEGIN
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        html.window.history.replaceState(null, '', 'index.html');
      });
    });
    // END
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: currecntStore.title.toString(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          primaryColor: Colors.blue),
      scrollBehavior: CustomScrollBehavior(),
      home: SiteLayout(),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
    };
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timepass/src/routes/pages.dart';
import 'package:timepass/src/routes/routes.dart';
import 'package:timepass/src/screens/register/register.dart';
import 'package:timepass/src/styles/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Pages.pageList,
      theme: themes.light,
      initialRoute: Routes.REGISTER,
      enableLog: kDebugMode,
      title: 'POD',
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/firebase_options.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';
import '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //firebase
  await Firebase.initializeApp(
    //firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greengrocer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:
          const SplashScreen(), //parei em 4:51 ja instalei pluggin firebase core e ja fiz firebase config
    );
  }
}

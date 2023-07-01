import 'package:flutter/material.dart';
import 'package:lofi_application/pages/home/intro_screen_onboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // const MyApp({required Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lofi App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // title: 'Flutter Demo',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        home: IntroScreenOnborad());
  }
}

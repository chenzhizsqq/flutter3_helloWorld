import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

//void main() => runApp(MyApp());

class FirstScreenApp extends StatelessWidget {
  const FirstScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: FirstScreen(),
        ),
      ),
    );
  }
}

/// Releaxing screen that stays visible for 3 seconds
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //Declare a timer
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer(
      const Duration(seconds: 1),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NextScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: NetworkImage(
          'https://flutter.cn/assets/images/cn/flutter-cn-logo.png'),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        //child: AppMenu(),
        child: MyApp(),
      ),
    );
  }
}

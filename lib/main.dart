import 'package:delivery/constants/colors.dart';
import 'package:delivery/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Map<int, Color> color = {
    50: const Color.fromRGBO(106, 133, 182, .1),
    100: const Color.fromRGBO(106, 133, 182, 0.2),
    200: const Color.fromRGBO(106, 133, 182, .3),
    300: const Color.fromRGBO(106, 133, 182, .4),
    400: const Color.fromRGBO(106, 133, 182, .5),
    500: const Color.fromRGBO(106, 133, 182, .6),
    600: const Color.fromRGBO(106, 133, 182, .7),
    700: const Color.fromRGBO(106, 133, 182, .8),
    800: const Color.fromRGBO(106, 133, 182, .9),
    900: const Color.fromRGBO(106, 133, 182, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: MaterialColor(AppColors.mainColor.value, color)),
      home: const LoginScreen(),
    );
  }
}

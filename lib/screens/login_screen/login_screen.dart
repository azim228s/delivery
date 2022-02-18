import 'package:delivery/constants/colors.dart';
import 'package:delivery/constants/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 50, bottom: 140),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.mainColor,
                    AppColors.mainColor.withOpacity(0.9),
                    AppColors.mainColor.withOpacity(0.5),
                    AppColors.monoWhite
                  ],
                ),
              ),
              width: double.infinity,
              child: Image.asset("assets/images/astana_hub.png",fit: BoxFit.fitHeight,),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(32),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Логин",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      Padding(
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        padding: EdgeInsets.only(left: 32),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: SvgPicture.asset("assets/icons/ic_email.svg",
                          height: 5, width: 5, fit: BoxFit.scaleDown),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Padding(
                        child: Text(
                          "Пароль",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        padding: EdgeInsets.only(left: 32),
                      ),
                    ],
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: SvgPicture.asset("assets/icons/ic_password.svg",
                          height: 5, width: 5, fit: BoxFit.scaleDown),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Забыли пароль?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                      title: "Войти",
                      onClick: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => BottomNavBarScreen()));
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Создать аккаунт",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

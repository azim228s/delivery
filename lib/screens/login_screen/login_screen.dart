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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // AppColors.MONO_VIOLET.withOpacity(0.6),
                  // AppColors.MONO_AVERAGE,
                  // AppColors.MONO_AVERAGE2,
                  // AppColors.PRIMARY_ORANGE,
                ],
                stops: [0.05, 0.3, 0.5, 0.7],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 300,
              width: double.infinity,
              // child: Image.asset("assets/images/logo_2.png"),
              child: Container(color: AppColors.MONO_BLACK,),
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
                        "Login",
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
                          "Password",
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
                        "Forget password?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                      title: "Login",
                      onClick: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => BottomNavBarScreen()));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

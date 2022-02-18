import 'package:delivery/constants/colors.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onClick;

  const CustomButton({Key? key, required this.title, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 16,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}
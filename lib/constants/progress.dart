import 'package:flutter/material.dart';

import 'colors.dart';

class ProgressCircular extends StatelessWidget {
  const ProgressCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 75,
          width: 75,
          child: CircularProgressIndicator(
            color: AppColors.mainColor,
          )),
    );
  }
}

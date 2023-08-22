import 'package:flutter/material.dart';

import '../colors.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          color: AppColors.progressIndicatorColor,
          backgroundColor: AppColors.transparentColor,
        ),
      ),
    );
  }
}

import 'package:dp_move/common/colors.dart';
import 'package:dp_move/common/photos_paths.dart';
import 'package:dp_move/common/texts.dart';
import 'package:flutter/material.dart';
import '../widgets/home_future_List.dart';

class MovieHome extends StatelessWidget {
  static String id = 'MovieHome';
  const MovieHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        centerTitle: true,
        title: const Text(
          AppTexts.homeTitle,
          style: TextStyle(
            color: AppColors.homeBackgroundColor,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(LocalPhotoPaths.background),
            fit: BoxFit.cover,
          ),
        ),
        child: const HomeFutureList(),
      ),
    );
  }
}



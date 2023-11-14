import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hotel/constants.dart';
import 'package:test_hotel/controllers/onboarding/onboarding_screen_controller.dart';

class TitikGeser extends GetView<OnboardingScreenController> {
  const TitikGeser({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 19,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: controller.currentIndex.value == index
            ? AppColors.primaryColor
            : AppColors.blackColor,
      ),
    );
  }
}

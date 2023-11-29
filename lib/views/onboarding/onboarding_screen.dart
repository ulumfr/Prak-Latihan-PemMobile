import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hotel/constants.dart';
import 'package:test_hotel/controllers/onboarding/onboarding_screen_controller.dart';
import 'package:test_hotel/models/onboarding/onboarding_model.dart';
import 'package:test_hotel/views/onboarding/components/titik_geser.dart';

class OnboardingScreen extends GetView<OnboardingScreenController> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.gray1Color,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 30),
              child: GestureDetector(
                onTap: () {
                  if (controller.currentIndex.value != geser.length - 1) {
                    controller.skipToAuthScreen();
                  }
                },
                child: Text(
                  controller.currentIndex.value == geser.length - 1
                      ? ''
                      : 'skip',
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.gray1Color,
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: geser.length,
                  onPageChanged: controller.ganti,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.sizeOf(context).width,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.34,
                                  margin: const EdgeInsets.only(
                                    left: 150,
                                    top: 90,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                      bottom: Radius.circular(100),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(geser[i].image1),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.34,
                                  margin: const EdgeInsets.only(
                                    right: 150,
                                    bottom: 90,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(10),
                                      top: Radius.circular(100),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(geser[i].image2),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              geser.length,
                              (index) => TitikGeser(index: index),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 7, top: 25),
                            child: Text(
                              geser[i].text,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              geser[i].dsc,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(
                  bottom: 73,
                  right: 20,
                  left: 20,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20),
                    right: Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  child: Text(
                    controller.currentIndex.value == geser.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: const TextStyle(
                      color: AppColors.gray1Color,
                      fontSize: 27,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    if (controller.currentIndex.value == geser.length - 1) {
                      controller.skipToAuthScreen();
                    } else {
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

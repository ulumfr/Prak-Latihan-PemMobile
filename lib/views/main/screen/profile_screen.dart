import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hotel/constants.dart';
import 'package:test_hotel/controllers/auth/auth_controller.dart';

class ProfileScreen extends GetView<AuthController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  controller.logout();
                },
                child: const Text(
                  "LOGOUT",
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

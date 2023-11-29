import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hotel/constants.dart';
import 'package:test_hotel/controllers/auth/auth_controller.dart';
import 'package:test_hotel/views/auth/components/button_auth.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
           horizontal: 60
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Authentication",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              ButtonAuth(
                text: "Login with Firebase",
                onTap: () {
                  controller.goLoginFirebase();
                },
              ),
              const SizedBox(height: 20),
              ButtonAuth(
                text: "Login with Appwrite",
                onTap: () {
                  controller.goLoginAppwrite();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

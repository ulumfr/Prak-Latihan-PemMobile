import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_hotel/constants.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: AppColors.primaryColor);
      goLogin();
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: AppColors.secondaryColor);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar('Success', 'Login successful',
          backgroundColor: AppColors.primaryColor);
      goMain();
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: AppColors.secondaryColor);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    await auth.signOut();
    goLogin();
  }

  void goLogin() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    Get.toNamed('/login');
  }

  void goSignup() {
    Get.toNamed('/signup');
  }

  void goForgot() {
    Get.toNamed('/forgot');
  }

  void goVerify() {
    Get.toNamed('/verify');
  }

  void goResetPass() {
    Get.toNamed('/reset');
  }

  void goMain() {
    emailController.clear();
    passwordController.clear();
    Get.offAndToNamed('/main');
  }
}

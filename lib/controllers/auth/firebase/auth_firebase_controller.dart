import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_hotel/constants.dart';

class AuthFirebaseController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  RxBool isLoading = false.obs;
  bool isSecure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> registerUserFirebase({
    String? username,
    required String email,
    required String password,
    required String confPassword,
  }) async {
    try {
      isLoading.value = true;
      if (password != confPassword) {
        throw 'Password and Confirm Password must match';
      }
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar(
        'Success',
        'Registration Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
      goLogin();
    } catch (error) {
      String errorMessage = 'Registration Failed';

      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'invalid-password':
            errorMessage = 'Password should be at least 6 characters long';
            break;
          case 'email-already-exists':
            errorMessage = 'The email is already in use by another account.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          default:
            errorMessage = '${error.message}';
        }
      } else if (error is String) {
        errorMessage = error;
      }
      Get.snackbar(
        'Error',
        errorMessage,
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUserFirebase(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar(
        'Success',
        'Login Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
      goMain();
    } catch (error) {
      Get.snackbar(
        'Error',
        'Login Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void logoutFirebase() async {
    try {
      isLoading.value = true;
      await auth.signOut();
      Get.snackbar(
        'Succes',
        'Logout Successful',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        'Logout Failed: $error',
        backgroundColor: AppColors.secondaryColor,
        colorText: AppColors.whiteColor,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confPasswordController.clear();
  }

  void goLogin() {
    clear();
    Get.toNamed('/loginFirebase');
  }

  void goSignup() {
    clear();
    Get.toNamed('/signupFirebase');
  }

  void goForgot() {
    Get.toNamed('/forgotFirebase');
  }

  void goVerify() {
    Get.toNamed('/verifyFirebase');
  }

  void goResetPass() {
    Get.toNamed('/resetFirebase');
  }

  void goMain() {
    clear();
    Get.offAndToNamed('/main');
  }
}

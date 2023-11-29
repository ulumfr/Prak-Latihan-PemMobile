import 'package:get/get.dart';
import 'package:test_hotel/controllers/auth/appwrite/auth_appwrite_controller.dart';
import 'package:test_hotel/controllers/auth/auth_controller.dart';
import 'package:test_hotel/controllers/auth/firebase/auth_firebase_controller.dart';
import 'package:test_hotel/controllers/main/home/home_screen_controller.dart';
import 'package:test_hotel/controllers/main/home/imagepicker_controller.dart';
import 'package:test_hotel/controllers/main/home/webviewhotel_controller.dart';
import 'package:test_hotel/controllers/main/main_screen_controller.dart';
import 'package:test_hotel/controllers/onboarding/onboarding_screen_controller.dart';
import 'package:test_hotel/controllers/onboarding/welcome_screen_controller.dart';
import 'package:test_hotel/views/auth/auth_screen.dart';
import 'package:test_hotel/views/auth/screen/appwrite/forgot_pass_appwrite_screen.dart';
import 'package:test_hotel/views/auth/screen/appwrite/login_appwrite_screen.dart';
import 'package:test_hotel/views/auth/screen/appwrite/reset_pass_appwrite_screen.dart';
import 'package:test_hotel/views/auth/screen/appwrite/signup_appwrite_screen.dart';
import 'package:test_hotel/views/auth/screen/appwrite/verify_forgot_appwrite_screen.dart';
import 'package:test_hotel/views/auth/screen/firebase/forgot_pass_firebase_screen.dart';
import 'package:test_hotel/views/auth/screen/firebase/login_firebase_screen.dart';
import 'package:test_hotel/views/auth/screen/firebase/reset_pass_firebase_screen.dart';
import 'package:test_hotel/views/auth/screen/firebase/signup_firebase_screen.dart';
import 'package:test_hotel/views/auth/screen/firebase/verify_forgot_firebase_screen.dart';
import 'package:test_hotel/views/main/components/home/webview/webview_nearby.dart';
import 'package:test_hotel/views/main/components/home/webview/webview_popular.dart';
import 'package:test_hotel/views/main/main_screen.dart';
import 'package:test_hotel/views/onboarding/onboarding_screen.dart';
import 'package:test_hotel/views/onboarding/welcome_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: '/welcome',
      page: () => const WelcomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(WelcomeScreenController());
      }),
    ),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnboardingScreenController());
      }),
    ),
    GetPage(
      name: '/loginFirebase',
      page: () => const LoginFirebaseScreen(),
      binding: BindingsBuilder(() {
        Get.put(AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/signupFirebase',
      page: () => const SignupFirebaseScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/forgotFirebase',
      page: () => const ForgotPassFirebaseScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/verifyFirebase',
      page: () => const VerifyForgotFirebaseScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/resetFirebase',
      page: () => const ResetPassFirebaseScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/loginAppwrite',
      page: () => const LoginAppwriteScreen(),
      binding: BindingsBuilder(() {
        Get.put(AuthAppwriteController());
      }),
    ),
    GetPage(
      name: '/signupAppwrite',
      page: () => const SignupAppwriteScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/forgotAppwrite',
      page: () => const ForgotPassAppwriteScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/verifyAppwrite',
      page: () => const VerifyForgotAppwriteScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/resetAppwrite',
      page: () => const ResetPassAppwriteScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => AuthFirebaseController());
      }),
    ),
    GetPage(
      name: '/auth',
      page: () => const AuthScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
    ),
    GetPage(
      name: '/main',
      page: () => const MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => MainScreenController());
        Get.lazyPut(() => ImagepickerController());
        Get.lazyPut(() => HomeScreenController());
      }),
    ),
    GetPage(
      name: '/webpopular',
      page: () => const WebviewPopular(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => WebviewhotelController());
      }),
    ),
    GetPage(
      name: '/webnearby',
      page: () => const WebviewNearby(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => WebviewhotelController());
      }),
    ),
  ];
}

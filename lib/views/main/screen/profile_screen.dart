import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hotel/constants.dart';
import 'package:test_hotel/controllers/auth/appwrite/auth_appwrite_controller.dart';
import 'package:test_hotel/controllers/auth/firebase/auth_firebase_controller.dart';
import 'package:test_hotel/views/main/components/profile/profile_list_item.dart';

class ProfileScreen extends GetView<AuthFirebaseController> {
  ProfileScreen({Key? key}) : super(key: key);

  final isloginUser = FirebaseAuth.instance.currentUser!;
  final AuthAppwriteController authController =
      Get.find<AuthAppwriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.settings,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(17),
                              image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/background-profile.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -35,
                            child: SizedBox(
                              width: 85,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                  image:
                                      AssetImage("assets/images/profile.png"),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 65,
                            child: Text(
                              // '${isloginUser.displayName ?? isloginUser.email}',
                              '${authController.username}',
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 23,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      ProfileListItem(
                        onTap: () {},
                        icon: Icons.edit,
                        text: "Edit Profile",
                      ),
                      const SizedBox(height: 20),
                      ProfileListItem(
                        onTap: () {},
                        icon: Icons.notifications,
                        text: "Notification",
                      ),
                      const SizedBox(height: 20),
                      ProfileListItem(
                        onTap: () {},
                        icon: Icons.toggle_on_outlined,
                        text: "Dark Mode",
                      ),
                      const SizedBox(height: 20),
                      ProfileListItem(
                        onTap: () {},
                        icon: Icons.card_giftcard,
                        text: "Voucher",
                      ),
                      const SizedBox(height: 20),
                      ProfileListItem(
                        onTap: () {},
                        icon: Icons.credit_card,
                        text: "Cards and Payment",
                      ),
                      const SizedBox(height: 20),
                      ProfileListItem(
                        onTap: () {},
                        icon: Icons.headset_mic,
                        text: "Customer Service",
                      ),
                      const SizedBox(height: 20),
                      ProfileListItem(
                        onTap: () {
                          controller.logoutFirebase();
                        },
                        icon: Icons.exit_to_app,
                        text: "Logout Firebase",
                      ),
                      const SizedBox(height: 20),
                      ProfileListItem(
                        onTap: () {
                          authController.logout();
                        },
                        icon: Icons.exit_to_app,
                        text: "Logout Appwrite",
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

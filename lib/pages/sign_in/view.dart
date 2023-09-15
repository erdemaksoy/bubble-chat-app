import 'package:firebase_chat/common/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';
import 'controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Container(
        width: 170.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(
          children: [
            Container(
              width: 150.w,
              height: 150.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 150.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryBackground,
                          boxShadow: [
                            Shadows.primaryShadow,
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/images/bubble5.png",
                      width: 150.w,
                      height: 150.w,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35.h, bottom: 35.h),
              child: Text(
                "Bubble",
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: [
                    Shadow(
                        blurRadius: 3.0,
                        color: Colors.black26,
                        offset: Offset(1.0, 1.0))
                  ],
                  color: AppColors.thirdElement,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.spMax,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildThirdPartyLogin() {
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(bottom: 250.h),
        child: Column(
          children: [
            Text(
              "Sign in with social networks",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.h,
                left: 50.w,
                right: 50.w,
              ),
              child: btnFlatButtonWidget(
                  onPressed: () {
                    controller.handleSignIn();
                  },
                  width: 200.w,
                  height: 55.h,
                  title: "Google Login"),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            Spacer(),
            _buildThirdPartyLogin(),
          ],
        ),
      ),
    );
  }
}

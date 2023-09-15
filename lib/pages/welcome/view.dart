import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_chat/pages/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/values/colors.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 176, 106, 231),
          Color.fromARGB(255, 166, 112, 231),
          Color.fromARGB(255, 131, 123, 231),
          Color.fromARGB(255, 104, 132, 231),
        ], transform: GradientRotation(90)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: 360.w,
          height: 7870.w,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                onPageChanged: (index) {
                  controller.changePage(index);
                },
                controller: PageController(
                  initialPage: 0,
                  keepPage: false,
                  viewportFraction: 1,
                ),
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      _buildBackground(),
                      ListView(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/bubble5.png"))),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 100.w,
                            child: Text(
                              "Slide",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir",
                                fontSize: 23.sp,
                                color: AppColors.primaryBackground,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.primaryBackground,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      _buildBackground(),
                      ListView(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 300.w,
                            height: 200.h,
                            child: Center(
                              child: Text(
                                "Send Free Message",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp,
                                  fontFamily: "Avenir",
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 300.w,
                            height: 200.h,
                            child: Column(
                              children: [
                                Text(
                                  "stay in touch with your friends,",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    fontFamily: "Avenir",
                                    color: AppColors.primaryBackground,
                                  ),
                                ),
                                Text(
                                  " easy to use,",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    fontFamily: "Avenir",
                                    color: AppColors.primaryBackground,
                                  ),
                                ),
                                Text(
                                  " and have a fun!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    fontFamily: "Avenir",
                                    color: AppColors.primaryBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      _buildBackground(),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 200.w),
                            width: double.infinity,
                            height: 100.h,
                            child: Center(
                              child: Text(
                                "Let's Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp,
                                  fontFamily: "Avenir",
                                  color: AppColors.primaryBackground,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: AppColors.primaryBackground,
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            bottom: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.handleSignIn();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                  const BorderSide(color: Colors.white),
                                ),
                              ),
                              child: Text("Login"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 70,
                child: DotsIndicator(
                  position: controller.state.index.value.toDouble(),
                  dotsCount: 3,
                  reversed: false,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: Size.square(9),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

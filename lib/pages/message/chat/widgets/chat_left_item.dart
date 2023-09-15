import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_chat/common/entities/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/routes/names.dart';
import '../../../../common/values/colors.dart';

Widget ChatLeftItem(Msgcontent item) {
  DateTime hour = DateTime.parse(item.addtime!.toDate().toString());
  String minute = "";

  if (hour.minute < 10) {
    minute = "0" + hour.minute.toString();
  } else {
    minute = hour.minute.toString();
  }

  return Container(
    padding: EdgeInsets.only(top: 10.w, left: 15.w, right: 15.w, bottom: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 230.w,
            minHeight: 40.w,
          ),
          child: Container(
            margin: EdgeInsets.only(right: 10.w, top: 0.w),
            padding: EdgeInsets.only(
                top: 10.w, left: 10.w, right: 10.w, bottom: 10.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 229, 173),
                  Color.fromARGB(255, 250, 220, 173),
                  Color.fromARGB(255, 245, 210, 173),
                  Color.fromARGB(255, 250, 200, 173),
                ],
                transform: GradientRotation(90),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: item.type == "text"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${item.content}"),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "${hour.hour}" + ":" + minute,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.fourElementText),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 200.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.Photoimgview,
                                parameters: {"url": item.content ?? ""});
                          },
                          child: CachedNetworkImage(
                            imageUrl: '${item.content}',
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "${hour.hour}" + ":" + minute,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.fourElementText),
                        ),
                      ),
                    ],
                  ),
          ),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_managment_system/src/utils/routs/app_routs.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {"title": "Play Quiz", "icon": Icons.quiz},
    {"title": "Assignment", "icon": Icons.assignment},
    {"title": "School Holiday", "icon": Icons.beach_access},
    {"title": "Time Table", "icon": Icons.calendar_today},
    {"title": "Result", "icon": Icons.receipt_long},
    {"title": "Date Sheet", "icon": Icons.event},
    {"title": "Ask Doubts", "icon": Icons.question_answer},
    {"title": "School Gallery", "icon": Icons.photo_album},
    {"title": "Leave Application", "icon": Icons.edit_note},
    {"title": "Change Password", "icon": Icons.lock},
    {"title": "Events", "icon": Icons.event_available},
    {"title": "Logout", "icon": Icons.logout},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF2C61F6),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi Student",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 0.5.h),
                        Text("Class XI-B | Roll no: 04",
                            style: TextStyle(color: Colors.white70, fontSize: 16.sp)),
                        SizedBox(height: 1.h),
                        Chip(
                          label: Text("2024-2025", style: TextStyle(fontSize: 15.sp)),
                          backgroundColor: Colors.white,
                          labelStyle: const TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRouts.profilePage),
                    child: CircleAvatar(
                      radius: 3.5.h,
                      backgroundImage: const NetworkImage(
                          'https://img.freepik.com/free-photo/stylish-korean-woman-hat-holds-backpack-points-finger-advertisement-shows-promo-offer-banner-s_1258-169348.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.w),
                    topRight: Radius.circular(10.w),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () => Get.toNamed(AppRouts.attendancePage),
                                        child: Container(
                                          padding: EdgeInsets.all(3.w),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(2.h),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(Icons.person,
                                                  size: 5.h, color: Colors.orange),
                                              SizedBox(height: 1.h),
                                              Text("80.39 %",
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight: FontWeight.bold)),
                                              Text("Attendance",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15.sp)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () => Get.toNamed(AppRouts.feePage),
                                        child: Container(
                                          padding: EdgeInsets.all(3.w),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(2.h),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(Icons.wallet,
                                                  size: 5.h, color: Colors.purple),
                                              SizedBox(height: 1.h),
                                              Text("₹6400",
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight: FontWeight.bold)),
                                              Text("Fees Due",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15.sp)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),

                                Wrap(
                                  
                                  spacing: 3.w,
                                  runSpacing: 3.w,
                                  children: menuItems.map((item) {
                                    double itemWidth = constraints.maxWidth > 600
                                        ? (constraints.maxWidth / 4) - 3.w
                                        : (constraints.maxWidth / 2) - 3.w;

                                    return SizedBox(
                                      width: itemWidth,
                                      child: InkWell(
                                        onTap: () {
                                          switch (item['title']) {
                                            case 'Play Quiz':
                                              Get.toNamed(AppRouts.quizPage);
                                              break;
                                            case 'Assignment':
                                              Get.toNamed(AppRouts.assignmentPage);
                                              break;
                                            case 'School Holiday':
                                              Get.toNamed(AppRouts.holidayPage);
                                              break;
                                            case 'Time Table':
                                              Get.toNamed(AppRouts.timeTablePage);
                                              break;
                                            case 'Result':
                                              Get.toNamed(AppRouts.resultPage);
                                              break;
                                            case 'Date Sheet':
                                              Get.toNamed(AppRouts.dateSheetPage);
                                              break;
                                            case 'Ask Doubts':
                                              Get.toNamed(AppRouts.askDoubtPage);
                                              break;
                                            case 'School Gallery':
                                              Get.toNamed(AppRouts.galleryPage);
                                              break;
                                            case 'Leave Application':
                                              Get.toNamed(AppRouts.leaveApplicationPage);
                                              break;
                                            case 'Change Password':
                                              Get.toNamed(AppRouts.changePasswordPage);
                                              break;
                                            case 'Events':
                                              Get.toNamed(AppRouts.eventsPage);
                                              break;
                                            case 'Logout':
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text("Logout Confirmation"),
                                                content: const Text("Are you sure you want to logout?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context), 
                                                    child: const Text("No"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context); 
                                                      Get.offAllNamed(AppRouts.loginPage); 
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                ],
                                              ),
                                            );
                                            break;
                                            default:
                                              Get.snackbar(
                                                  'Notice', 'This feature is coming soon');
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade50,
                                            borderRadius: BorderRadius.circular(2.h),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(item['icon'],
                                                  color: Colors.blue, size: 4.h),
                                              SizedBox(height: 1.h),
                                              Text(
                                                item['title'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

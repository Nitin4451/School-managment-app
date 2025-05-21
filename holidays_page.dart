import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HolidaysPage extends StatelessWidget {
  final List<Map<String, String>> holidays = [
    {
      'title': 'Republic Day',
      'date': '26 Jan 2025',
      'description': 'National holiday celebrating the constitution of India.'
    },
    {
      'title': 'Holi',
      'date': '17 Mar 2025',
      'description': 'Festival of colors, celebrated across the country.'
    },
    {
      'title': 'Summer Break',
      'date': '01 May - 15 Jun 2025',
      'description': 'Annual summer holidays for all students.'
    },
    {
      'title': 'Diwali Break',
      'date': '30 Oct - 05 Nov 2025',
      'description': 'Festival of Lights – school remains closed for the week.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2C61F6), Color(0xFF3A62E7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    children: [
                      IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },),
                      SizedBox(width: 3.w),
                      Text(
                        "School Holidays",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 20.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.w),
                      topRight: Radius.circular(10.w),
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: holidays.length,
                    separatorBuilder: (context, index) => SizedBox(height: 2.h),
                    itemBuilder: (context, index) {
                      final holiday = holidays[index];
                      return Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(3.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              holiday['title'] ?? '',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Icon(Icons.calendar_today,
                                    color: Colors.blueAccent, size: 17.sp),
                                SizedBox(width: 2.w),
                                Text(
                                  holiday['date'] ?? '',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            if (holiday['description'] != null)
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: Text(
                                  holiday['description']!,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DatesheetPage extends StatelessWidget {
  final List<ExamSchedule> schedules = [
    ExamSchedule(date: 11, month: "JAN", subject: "Science", day: "Monday"),
    ExamSchedule(date: 13, month: "JAN", subject: "English", day: "Wednesday"),
    ExamSchedule(date: 15, month: "JAN", subject: "Hindi", day: "Friday"),
    ExamSchedule(date: 18, month: "JAN", subject: "Math", day: "Monday"),
    ExamSchedule(date: 20, month: "JAN", subject: "Social Study", day: "Wednesday"),
    ExamSchedule(date: 22, month: "JAN", subject: "Drawing", day: "Friday"),
    ExamSchedule(date: 25, month: "JAN", subject: "Computer", day: "Monday"),
  ];

  DatesheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF2C61F6),
      body: Stack(
        children: [
          Positioned(
            top: 20.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.w),
                  topRight: Radius.circular(10.w),
                ),
              ),
              child: ListView.separated(
                itemCount: schedules.length,
                separatorBuilder: (_, __) => Divider(color: Colors.grey.shade300),
                itemBuilder: (context, index) {
                  final item = schedules[index];
                  return Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${item.date}", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                          Text(item.month, style: TextStyle(fontSize: 14.sp)),
                        ],
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.subject, style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500)),
                            Text(item.day, style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.grey, size: 18.sp),
                          SizedBox(width: 1.w),
                          Text("09:00 AM", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Row(
                  children: [
                    IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },),
                    SizedBox(width: 4.w),
                    Text(
                      "Datesheet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ExamSchedule {
  final int date;
  final String month;
  final String subject;
  final String day;

  ExamSchedule({
    required this.date,
    required this.month,
    required this.subject,
    required this.day,
  });
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  int selectedDayIndex = 0;

  final Map<String, List<Map<String, String>>> timetable = {
    'Mon': [
      {
        'subject': 'Computer Science',
        'time': '08:15am - 09:00am',
        'teacher': 'Cherise James',
        'period': 'Period 1',
      },
      {
        'subject': 'Mathematics',
        'time': '09:00am - 09:45am',
        'teacher': 'Rivka Steadman',
        'period': 'Period 2',
      },
      {
        'subject': 'English',
        'time': '09:45am - 10:30am',
        'teacher': 'Marta Magana',
        'period': 'Period 3',
      },
      {
        'subject': 'Lunch Break',
        'time': '10:30am - 11:00am',
        'emoji': '🥕',
      },
      {
        'subject': 'Science',
        'time': '11:00am - 11:45am',
        'teacher': 'Danica Partridge',
        'period': 'Period 4',
      },
      {
        'subject': 'Social Study',
        'time': '11:45am - 12:30pm',
        'teacher': 'Leland Oliver',
        'period': 'Period 5',
      },
    ],
    // Add data for other weekdays as needed
  };

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: const Color(0xFFe5f0ff),
          appBar: AppBar(
            backgroundColor: const Color(0xFFe5f0ff),
            elevation: 0,
            leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },),
            title: Text("Timetable", style: TextStyle(color: Colors.black, fontSize: 18.sp)),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Weekday Selector
                Container(
                  height: 5.h,
                  margin: EdgeInsets.only(bottom: 2.h),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weekdays.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedDayIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDayIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          margin: EdgeInsets.only(right: 2.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(3.w),
                          ),
                          child: Text(
                            weekdays[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.blue : Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Timetable List
                Expanded(
                  child: ListView.builder(
                    itemCount: timetable[weekdays[selectedDayIndex]]?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = timetable[weekdays[selectedDayIndex]]![index];
                      final isBreak = item['subject'] == 'Lunch Break';

                      return Container(
                        margin: EdgeInsets.only(bottom: 2.h),
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              offset: const Offset(2, 4),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['subject']!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp)),
                            SizedBox(height: 1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item['time']!,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.grey.shade600)),
                                isBreak
                                    ? Text(item['emoji']!, style: TextStyle(fontSize: 20.sp))
                                    : Text(item['period']!,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blueGrey)),
                              ],
                            ),
                            if (!isBreak) ...[
                              SizedBox(height: 1.h),
                              Text(item['teacher']!,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.grey.shade700)),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

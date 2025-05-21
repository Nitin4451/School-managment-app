import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  final List<Map<String, String>> events = const [
    {
      'title': 'Sleepover Night',
      'date': '06 Jan 21, 09:00 AM',
      'description': 'A sleepover is a great treat for kids. Many schools use such an event as the culminating activity of the school year.',
    },
    {
      'title': 'Fishing Tournament',
      'date': '12 Jan 21, 09:00 AM',
      'description': 'Silver Sands Middle School in Port Orange, Florida, offers many special events, but one of the most unique ones is a springtime...',
    },
    {
      'title': 'Rhyme Time: A Night of Poetry',
      'date': '24 Jan 21, 09:00 AM',
      'description': 'April is also National Poetry Month. Now there is a great theme for a fun family night! Combine poetry readings by students...',
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
                        "Events & Programs",
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
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.w),
                      topRight: Radius.circular(10.w),
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: events.length,
                    separatorBuilder: (_, __) => SizedBox(height: 2.h),
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(4.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 14.w,
                              height: 14.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event['title']!,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          size: 16.sp,
                                          color: const Color(0xFF2C61F6)),
                                      SizedBox(width: 1.w),
                                      Text(
                                        event['date']!,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: const Color(0xFF2C61F6),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    event['description']!,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
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

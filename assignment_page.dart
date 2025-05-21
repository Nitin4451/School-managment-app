import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AssignmentPage extends StatelessWidget {
  final List<Map<String, String>> assignments = [
    {
      'subject': 'Mathematics',
      'title': 'Surface Areas and Volumes',
      'assignDate': '10 Nov 20',
      'submitDate': '10 Dec 20'
    },
    {
      'subject': 'Science',
      'title': 'Structure of Atoms',
      'assignDate': '10 Oct 20',
      'submitDate': '30 Oct 20'
    },
    {
      'subject': 'English',
      'title': 'My Bestfriend Essay',
      'assignDate': '10 Sep 20',
      'submitDate': '30 Sep 20'
    },
  ];

  Color getSubjectColor(String subject) {
    switch (subject) {
      case 'Mathematics':
        return Colors.blueAccent;
      case 'Science':
        return Colors.lightBlue;
      case 'English':
        return Colors.indigo.shade300;
      default:
        return Colors.grey;
    }
  }

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
            title: Text("Assignment", style: TextStyle(color: Colors.black, fontSize: 18.sp)),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: ListView.builder(
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                final assignment = assignments[index];
                final subjectColor = getSubjectColor(assignment['subject']!);

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
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                        decoration: BoxDecoration(
                          color: subjectColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Text(
                          assignment['subject']!,
                          style: TextStyle(
                            color: subjectColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.5.h),

                      Text(
                        assignment['title']!,
                        style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 2.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Assign Date"),
                          Text(
                            assignment['assignDate']!,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Last Submission Date"),
                          Text(
                            assignment['submitDate']!,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.w),
                            ),
                          ),
                          child: Text("TO BE SUBMITTED", style: TextStyle(fontSize: 16.sp)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

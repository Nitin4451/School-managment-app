import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResultPage extends StatelessWidget {
  final String studentName = "Akshay Syal";
  final double averageGrade = 85;
  final String overallGrade = "A";

  final List<SubjectGrade> grades = [
    SubjectGrade("English", 100, 74, "B"),
    SubjectGrade("Hindi", 100, 87, "B"),
    SubjectGrade("Science", 100, 74, "B"),
    SubjectGrade("Math", 100, 87, "B"),
    SubjectGrade("Social Study", 100, 89, "B"),
    SubjectGrade("Drawing", 100, 78, "B"),
    SubjectGrade("Computer", 100, 96, "A"),
  ];

  ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 2.h),
                GradeCircle(grade: averageGrade, overallGrade: overallGrade),
                SizedBox(height: 2.h),
                Text(
                  "You are Excellent,\n${studentName.toUpperCase()} !!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.h),
                GradeTable(grades: grades),
                SizedBox(height: 4.h),
                ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: Icon(Icons.download, size: 18.sp),
                  label: Text("Download PDF", style: TextStyle(fontSize: 16.sp)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 1.5.h,
                    ),
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

class SubjectGrade {
  final String subject;
  final int totalMarks;
  final int obtainedMarks;
  final String grade;

  SubjectGrade(this.subject, this.totalMarks, this.obtainedMarks, this.grade);
}

class GradeCircle extends StatelessWidget {
  final double grade;
  final String overallGrade;

  const GradeCircle({
    super.key,
    required this.grade,
    required this.overallGrade,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 35.w,
          height: 35.w,
          child: CircularProgressIndicator(
            value: grade / 100,
            strokeWidth: 1.8.w,
            backgroundColor: Colors.grey.shade300,
            color: Colors.blueAccent,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${grade.toInt()}%",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Grade $overallGrade",
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        )
      ],
    );
  }
}

class GradeTable extends StatelessWidget {
  final List<SubjectGrade> grades;

  const GradeTable({super.key, required this.grades});

  Color _getGradeColor(String grade) {
    switch (grade) {
      case "A":
        return Colors.green;
      case "B":
        return Colors.orange;
      case "C":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(3.w),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: grades.map((g) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 0.8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 3, child: Text(g.subject, style: TextStyle(fontSize: 16.sp))),
                Expanded(child: Center(child: Text("${g.totalMarks}", style: TextStyle(color: Colors.black54, fontSize: 14.sp)))),
                Expanded(child: Center(child: Text("${g.obtainedMarks}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)))),
                Expanded(child: Center(child: Text(g.grade, style: TextStyle(color: _getGradeColor(g.grade), fontWeight: FontWeight.bold, fontSize: 14.sp)))),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

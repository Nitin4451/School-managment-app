import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AskdoubtPage extends StatefulWidget {
  const AskdoubtPage({super.key});

  @override
  State<AskdoubtPage> createState() => _AskDoubtPageState();
}

class _AskDoubtPageState extends State<AskdoubtPage> {
  String selectedTeacher = "Alexa Clark";
  String selectedSubject = "Math";

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<String> teachers = ["Alexa Clark", "John Smith", "Sara Lee"];
  final List<String> subjects = ["Math", "Science", "English","Hindi","Computer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C61F6),
      body: Stack(
        children: [
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
              child: ListView(
                children: [
                  SizedBox(height: 2.h),

                  Text("Select Teacher", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                  DropdownButtonFormField<String>(
                    value: selectedTeacher,
                    decoration: const InputDecoration(border: InputBorder.none),
                    items: teachers.map((String teacher) {
                      return DropdownMenuItem<String>(
                        value: teacher,
                        child: Text(teacher, style: TextStyle(fontSize: 17.sp)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedTeacher = value!;
                      });
                    },
                  ),
                  Divider(),

                  SizedBox(height: 2.h),

                  Text("Select Subject", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                  DropdownButtonFormField<String>(
                    value: selectedSubject,
                    decoration: const InputDecoration(border: InputBorder.none),
                    items: subjects.map((String subject) {
                      return DropdownMenuItem<String>(
                        value: subject,
                        child: Text(subject, style: TextStyle(fontSize: 17.sp)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value!;
                      });
                    },
                  ),
                  Divider(),

                  SizedBox(height: 2.h),

                  Text("Title", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter title",
                    ),
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  Divider(),

                  SizedBox(height: 2.h),

                  Text("Doubt Description", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                  TextField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "--",
                    ),
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  Divider(),

                  SizedBox(height: 4.h),

                  SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      ),
                      child: Text("SEND", style: TextStyle(fontSize: 17.sp, color: Colors.white)),
                    ),
                  ),
                ],
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
                      "Ask Doubt",
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

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LeeveapplicationPage extends StatefulWidget {
  const LeeveapplicationPage({super.key});

  @override
  State<LeeveapplicationPage> createState() => _LeaveApplicationPageState();
}

class _LeaveApplicationPageState extends State<LeeveapplicationPage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedLeaveType;
  DateTime? fromDate;
  DateTime? toDate;
  final TextEditingController reasonController = TextEditingController();

  final List<String> leaveTypes = ['Sick Leave', 'Casual Leave', 'Annual Leave'];

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

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
                        "Leave Application",
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
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.w),
                      topRight: Radius.circular(10.w),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Leave Type',
                            border: UnderlineInputBorder(),
                          ),
                          value: selectedLeaveType,
                          items: leaveTypes
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLeaveType = value;
                            });
                          },
                          validator: (value) =>
                              value == null ? 'Please select leave type' : null,
                        ),
                        SizedBox(height: 2.h),

                        GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'From Date',
                                border: UnderlineInputBorder(),
                              ),
                              controller: TextEditingController(
                                  text: fromDate != null
                                      ? "${fromDate!.day}/${fromDate!.month}/${fromDate!.year}"
                                      : ""),
                              validator: (_) =>
                                  fromDate == null ? 'Select a date' : null,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),

                        GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'To Date',
                                border: UnderlineInputBorder(),
                              ),
                              controller: TextEditingController(
                                  text: toDate != null
                                      ? "${toDate!.day}/${toDate!.month}/${toDate!.year}"
                                      : ""),
                              validator: (_) =>
                                  toDate == null ? 'Select a date' : null,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),

                        TextFormField(
                          controller: reasonController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            labelText: 'Reason',
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter a reason'
                                  : null,
                        ),
                        SizedBox(height: 4.h),

                        SizedBox(
                          height: 7.h,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Leave Application Submitted"),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2C61F6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                            ),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

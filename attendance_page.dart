import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime(2025, 1, 1);
  DateTime? _selectedDay;

  final List<DateTime> absentDates = [DateTime(2025, 1, 8), DateTime(2025, 2, 24)];
  final List<DateTime> holidayDates = [DateTime(2025, 3, 20),DateTime(2025,2,5)];

  String _selectedToggle = "ATTENDANCE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C61F6),
      body: Column(
        children: [
          // Header
          Container(
            height: 160,
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: [
                    _buildToggleButton("ATTENDANCE"),
                    const SizedBox(width: 8),
                    _buildToggleButton("HOLIDAY"),
                  ],
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.utc(2025, 1, 1),
                      lastDay: DateTime.utc(2025, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      onFormatChanged: (format) {
                        setState(() => _calendarFormat = format);
                      },
                      onPageChanged: (focusedDay) => _focusedDay = focusedDay,
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          if (_selectedToggle == "ATTENDANCE" &&
                              absentDates.any((d) => isSameDay(d, day))) {
                            return _buildMarkedDate(day, Colors.red);
                          } else if (_selectedToggle == "HOLIDAY" &&
                              holidayDates.any((d) => isSameDay(d, day))) {
                            return _buildMarkedDate(day, Colors.green);
                          } else if (day.weekday == DateTime.sunday) {
                            return _buildMarkedDate(day, Colors.blue.shade100);
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_selectedToggle == "ATTENDANCE")
                      _buildLegendItem("Absent", "${absentDates.length}", Colors.red.shade100, Colors.red),
                    if (_selectedToggle == "HOLIDAY")
                      _buildLegendItem("Festival & Holidays", "${holidayDates.length}", Colors.green.shade100, Colors.green),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text) {
    final bool isSelected = _selectedToggle == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedToggle = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? const Color(0xFF2C61F6) : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMarkedDate(DateTime day, Color color) {
    return Center(
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String title, String count, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: textColor, fontSize: 16)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(count, style: const TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:school_managment_system/src/views/askdoubt_page.dart';
import 'package:school_managment_system/src/views/assignment_page.dart';
import 'package:school_managment_system/src/views/attendance_page.dart';
import 'package:school_managment_system/src/views/changepassword_page.dart';
import 'package:school_managment_system/src/views/datesheet_page.dart';
import 'package:school_managment_system/src/views/events_page.dart';
import 'package:school_managment_system/src/views/fee_page.dart';
import 'package:school_managment_system/src/views/gallery_page.dart';
import 'package:school_managment_system/src/views/holidays_page.dart';
import 'package:school_managment_system/src/views/home_page.dart';
import 'package:school_managment_system/src/views/leeveapplication_page.dart';
import 'package:school_managment_system/src/views/login_page.dart';
import 'package:school_managment_system/src/views/profile_page.dart';
import 'package:school_managment_system/src/views/quiz_page.dart';
import 'package:school_managment_system/src/views/result_page.dart';
import 'package:school_managment_system/src/views/signup_page.dart';
import 'package:school_managment_system/src/views/splash_screen.dart';
import 'package:school_managment_system/src/views/timetable_page.dart';

class AppRouts {
  static const splashScreen = '/';
  static const loginPage = '/login_page';
  static const signPage = '/signup_page';
  static const homePage = '/home_page';
  static const profilePage = '/profile_page';
  static const attendancePage = '/attendance_page';
  static const feePage = '/fee_page';
  static const quizPage = '/quiz_page';
  static const askDoubtPage = '/askdoubt_page';
  static const assignmentPage = '/assignment_page';
  static const changePasswordPage = '/changepassword_page';
  static const dateSheetPage = '/datesheet_page';
  static const eventsPage = '/events_page';
  static const galleryPage = '/gallery_page';
  static const holidayPage = '/holidays_page';
  static const leaveApplicationPage = '/leeveapplication_page';
  static const resultPage = '/result_page';
  static const timeTablePage = '/timetable_page';

  static final routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: signPage, page: () => SignupPage()), 
    GetPage(name: homePage, page: () => HomePage()),   
    GetPage(name: profilePage, page: () => ProfilePage()),   
    GetPage(name: attendancePage, page: () => AttendancePage()),   
    GetPage(name: feePage, page: () => FeePage()),   
    GetPage(name: quizPage, page: () => QuizPage()),   
    GetPage(name: askDoubtPage, page: () => AskdoubtPage()),   
    GetPage(name: assignmentPage, page: () => AssignmentPage()),   
    GetPage(name: changePasswordPage, page: () => ChangepasswordPage()),   
    GetPage(name: dateSheetPage, page: () => DatesheetPage()),   
    GetPage(name: eventsPage, page: () => EventsPage()),   
    GetPage(name: galleryPage, page: () => GalleryPage()),   
    GetPage(name: holidayPage, page: () => HolidaysPage()),   
    GetPage(name: leaveApplicationPage, page: () => LeeveapplicationPage()),   
    GetPage(name: resultPage, page: () => ResultPage()),   
    GetPage(name: timeTablePage, page: () => TimetablePage()),   
  ];
}

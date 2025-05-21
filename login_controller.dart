import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_managment_system/src/views/home_page.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isEmailValid = true.obs;
  var isPasswordValid = true.obs;
  var isLoding = false.obs;

  void validateEmail(String email) {
    isEmailValid.value = email.isNotEmpty && email.contains('@gmail.com');
  }

  void validatePassword(String password) {
    final hasMinLength = password.length >= 6;
    final hasSpecialChar = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    isPasswordValid.value = password.isNotEmpty && hasMinLength && hasSpecialChar;
  }

  Future<void> login() async {
    validateEmail(emailController.text);
    validatePassword(passwordController.text);

    if (isEmailValid.value && isPasswordValid.value) {
      isLoding.value = true;

      await Future.delayed(const Duration(seconds: 2)); 
      isLoding.value = false;

      Get.offAll(() =>  HomePage()); 
      Get.snackbar('Success', 'Login Successful', snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Failed', 'Please enter valid email and password', snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_managment_system/src/views/home_page.dart';

class SignupController extends GetxController {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  
  var isIdValid = true.obs;
  var isNameValid = true.obs;
  var isEmailValid = true.obs;
  var isNumberValid = true.obs;
  var isPasswordValid = true.obs;
  var isLoding = false.obs;


void validateId(String id) {
    isIdValid.value = id.isNotEmpty && RegExp(r'^\d+$').hasMatch(id);
  }

void validateName(String name) {
    isNameValid.value = name.isNotEmpty && name.contains(RegExp(r'[A-Z,a-z]'));
  }

  void validateEmail(String email) {
    isEmailValid.value = email.isNotEmpty && email.contains('@gmail.com');
  }

  void validateNumber(String number) {
    isNumberValid.value = number.isNotEmpty && number.contains(RegExp(r'[0-9]'));
  }

  void validatePassword(String password) {
    final hasMinLength = password.length >= 6;
    final hasSpecialChar = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    isPasswordValid.value = password.isNotEmpty && hasMinLength && hasSpecialChar;
  }

  Future<void> login() async {
    validateEmail(emailController.text);
    validateId(idController.text);
    validateName(nameController.text);
    validateNumber(numberController.text);
    validatePassword(passwordController.text);

    if (isEmailValid.value && isPasswordValid.value && isIdValid.value && isNameValid.value && isNameValid.value) {
      isLoding.value = true;

      await Future.delayed(const Duration(seconds: 2)); 
      isLoding.value = false;

      Get.offAll(() =>  HomePage()); 
      Get.snackbar('Success', 'Login Successful', snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Failed', 'Please enter valid details', snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
void onClose() {
  idController.dispose();
  nameController.dispose();
  emailController.dispose();
  numberController.dispose();
  passwordController.dispose();
  super.onClose();
}
}

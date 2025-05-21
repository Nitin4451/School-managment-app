import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_managment_system/src/utils/app_validators.dart';
import 'package:school_managment_system/src/utils/routs/app_routs.dart';
import 'package:school_managment_system/src/utils/routs/signup_controller.dart';
import 'package:school_managment_system/src/views/home_page.dart';

class SignupPage extends StatelessWidget {

  final signupController = Get.put(SignupController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);

  final formKey = GlobalKey<FormState>();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF2C61F6),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(
                bottom: min(MediaQuery.of(context).viewInsets.bottom, 90),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 40),
                                const Text(
                                  'Hi Student',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Please register here to continue',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 30),

                                _buildTextFormField(
                                  controller: idController,
                                  hintText: 'Enter Your ID',
                                  validator: AppValidators.idValidation,
                                  
                                  icon: Icons.person,
                                  keyboardType: TextInputType.number,
                                ),
                                _buildTextFormField(
                                  controller: nameController,
                                  hintText: 'Enter Your Name',
                                  validator: AppValidators.nameValidation,
                                  icon: Icons.perm_identity,
                                ),
                                _buildTextFormField(
                                  controller: emailController,
                                  hintText: 'Enter Your Email',
                                  validator: AppValidators.emailValidation,
                                  icon: Icons.email,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                _buildTextFormField(
                                  controller: phoneController,
                                  hintText: 'Enter Your Number',
                                  validator: AppValidators.phoneValidation,
                                  icon: Icons.phone,
                                  keyboardType: TextInputType.phone,
                                ),
                                ValueListenableBuilder<bool>(
                                  valueListenable: obscurePassword,
                                  builder: (context, value, child) {
                                    return _buildTextFormField(
                                      controller: passwordController,
                                      hintText: 'Enter Password',
                                      validator: AppValidators.passwordValidation,
                                      icon: Icons.password,
                                      obscureText: value,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          value ? Icons.visibility : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          obscurePassword.value = !value;
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton.icon(
                                    icon: const Text(
                                      'SIGN UP',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    label: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2C61F6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState?.validate() ?? false) {
                                        Get.to(HomePage());
                                      }
                                    },
                                  ),
                                ),
                                const Spacer(),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Already have an account? "),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(AppRouts.loginPage);
                                        },
                                        child: const Text(
                                          "SIGN IN",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/vector (1).svg',
                height: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

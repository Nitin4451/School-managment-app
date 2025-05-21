import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_managment_system/src/utils/app_validators.dart';
import 'package:school_managment_system/src/utils/constants/app_sizer.dart';
import 'package:school_managment_system/src/utils/routs/app_routs.dart';
import 'package:school_managment_system/src/utils/routs/login_controller.dart';

class LoginPage extends StatelessWidget {

  final loginController = Get.put(LoginController());
  final emailController = TextEditingController();
final passwordController = TextEditingController();
  // final TextEditingController idController = TextEditingController();
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();

  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);

  final formKey = GlobalKey<FormState>();
final AppSizer s = AppSizer();
  LoginPage({super.key});

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
                        Text(
                          'Hi Student',
                          style: TextStyle(fontSize: s.deviceSp20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: s.deviceHeight1),
                        Text(
                          'Sign in to continue',
                          style: TextStyle(fontSize: s.deviceSp14, color: Colors.grey),
                        ),
                        SizedBox(height: s.deviceHeight3),

                        Text(
                          'Mobile Number/Email',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: s.deviceSp14),
                        ),
                        SizedBox(height: s.deviceHeight1),
                        TextFormField(
                           controller: loginController.emailController,
                          validator: (value) => AppValidators.emailValidation(value),
                          decoration: const InputDecoration(hintText: 'abc@gmail.com'),
                        ),
                        SizedBox(height: s.deviceHeight2),

                        Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: s.deviceSp14),
                        ),
                        SizedBox(height: s.deviceHeight1),
                        ValueListenableBuilder<bool>(
                          valueListenable: obscurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: loginController.passwordController,
                              validator: (value) => AppValidators.passwordValidation(value),
                              obscureText: value,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(value ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () => obscurePassword.value = !value,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: s.deviceHeight3),

                        SizedBox(
                          width: double.infinity,
                          height: s.deviceHeight6,
                          child: ElevatedButton.icon(
                            icon: Text('SIGN IN',
                                style: TextStyle(color: Colors.black, fontSize: s.deviceSp16)),
                            label: Icon(Icons.arrow_forward,
                                color: Colors.black, size: s.deviceSp16),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2C61F6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(s.deviceWidth2),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginController.login();
                              }
                            },
                          ),
                        ),
                        SizedBox(height: s.deviceHeight2),

                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Forgot Password?',
                                style: TextStyle(fontSize: s.deviceSp14)),
                          ),
                        ),

                        SizedBox(height: s.deviceHeight3),

                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?",
                                  style: TextStyle(fontSize: s.deviceSp14)),
                              InkWell(
                                onTap: () => Get.toNamed(AppRouts.signPage),
                                child: Text(
                                  " SIGN UP",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: s.deviceSp14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: s.deviceHeight2),
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

  // Widget _buildTextFormField({
  //   required TextEditingController controller,
  //   required String hintText,
  //   required String? Function(String?) validator,
  //   required IconData icon,
  //   TextInputType? keyboardType,
  //   bool obscureText = false,
  //   Widget? suffixIcon,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8),
  //     child: SizedBox(
  //       height: 50,
  //       width: double.infinity,
  //       child: TextFormField(
  //         controller: controller,
  //         obscureText: obscureText,
  //         keyboardType: keyboardType,
  //         validator: validator,
  //         decoration: InputDecoration(
  //           prefixIcon: Icon(icon),
  //           hintText: hintText,
  //           suffixIcon: suffixIcon,
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  }


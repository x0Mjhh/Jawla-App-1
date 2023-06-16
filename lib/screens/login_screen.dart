import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jawla_app/components/button.dart';
import 'package:jawla_app/components/text_field.dart';
import 'package:jawla_app/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:jawla_app/extensions/format.dart';
import 'package:jawla_app/extensions/navigators.dart';
import 'package:jawla_app/services/api/auth/forget_password.dart';
import 'package:jawla_app/services/api/auth/login_response.dart';
import 'package:jawla_app/services/api/auth/update_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../constants/app_styles.dart';
import 'my_navigation_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  int currentview = 0;
  List<Widget> views = [];
  String email = "";
  String currentPinCode = "";
  String pinCode = "";

  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      emailResetPasswordController = TextEditingController(),
      newPasswordController = TextEditingController(),
      confirmNewPasswordController = TextEditingController(),
      pinCodeController = TextEditingController();

  @override
  void initState() {
    views = [enterEmail(), enterPinCode(), resetPasswrd()];
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailResetPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    // pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: loginScreen(context));
  }

// ------------------ *** Login Screen *** ------------------
  Widget loginScreen(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login-page-bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/logo.png"),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hint: "Email",
                    iconName: Icons.email_outlined,
                    controller: emailController,
                  ),
                  CustomTextField(
                    hint: "Password",
                    iconName: Icons.lock_outline_rounded,
                    controller: passwordController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      opensheet(context);
                    },
                    child: const Text(
                      "Forgot your password?",
                      style: forgetPasswordStyle,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Login",
                    onPressed: () async {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        if (emailController.text.isValidEmail) {
                          // ---------- login response ----------
                          final response = await loginResponse(body: {
                            "email": emailController.text,
                            "password": passwordController.text
                          });
                          print(response.body);

                          try {
                            if (response.statusCode == 200) {
                              final box = GetStorage();
                              box.write(
                                  "token", json.decode(response.body)["Token"]);
                              if (!mounted) return;
                              context.pushAndRemoveUntil(
                                  screen: const MyNavigationBar());
                            } else {
                              snackBar(json.decode(response.body)["msg"]);
                            }
                          } catch (error) {
                            snackBar("No connection");
                          }
                        } else {
                          snackBar("Enter valid email");
                        }
                      } else {
                        snackBar("Enter your email and password");
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(height: 40, thickness: 3, color: greyButtonColor),
                      Text("Or", style: haveAccountStyle),
                      Divider(height: 40, thickness: 3, color: greyButtonColor),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet? ",
                        style: haveAccountStyle,
                      ),
                      InkWell(
                        onTap: () {
                          // context.push(screen: const SignUpScreen());
                        },
                        child: Text(
                          "Sign up",
                          style: haveAccountStyle.copyWith(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 140),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// ------------------ *** Forget Password Modal Bottom Sheets *** ------------------
  opensheet(BuildContext context) {
    showModalBottomSheet(
      context: (context),
      enableDrag: true,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SizedBox(
            height: 600,
            child: Scaffold(
                backgroundColor: Colors.transparent, body: views[currentview]));
      },
    );
  }

// --------------- snack bar ---------------
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: myTertiaryColor,
        content: Text(
          message!,
          style: const TextStyle(color: primaryColor, fontSize: 14),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

// ------------------ Modal Bottom Sheet (1) [ Enter Email ] ------------------
  Widget enterEmail() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 244, 244),
          borderRadius: BorderRadius.circular(20)),
      height: 600,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height32,
            const Text(
              "Forget Password",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            height24,
            const Text(
              "Please enter your Email to receive a verification code.",
              style: TextStyle(fontSize: 16),
            ),
            height48,
            CustomTextField(
                hint: "Email",
                iconName: Icons.email_outlined,
                controller: emailResetPasswordController),
            height96,
            Center(
              child: CustomButton(
                  onPressed: () async {
                    if (emailResetPasswordController.text.isValidEmail) {
                      // ---------- forget password response ----------
                      final response = await forgetPassword(
                          body: {"email": emailResetPasswordController.text});
                      print(response.body);

                      try {
                        if (response.statusCode == 200) {
                          email = emailResetPasswordController.text;
                          currentview = 1;
                          emailResetPasswordController.clear();

                          if (!mounted) return;
                          Navigator.pop(context);
                          opensheet(context);
                        } else {
                          snackBar(json.decode(response.body)["msg"]);
                        }
                      } catch (error) {
                        snackBar("No connection");
                      }
                    } else {
                      snackBar("Enter valid email");
                    }
                  },
                  text: "Continue"),
            )
          ],
        ),
      ),
    );
  }

// ----------------- Modal Bottom Sheet (2) [ Enter Pin Code ] -----------------
  Widget enterPinCode() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 244, 244),
          borderRadius: BorderRadius.circular(20)),
      height: 600,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height32,
            const Text(
              "Enter 6 Digits Code",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            height24,
            const Text(
              "Enter the 6 digits code thet you received on your email.",
              style: TextStyle(fontSize: 16),
            ),
            height48,
            pinCodeTextField(context), // <-- pin code text fields
            height56,
            Center(
              child: CustomButton(
                  onPressed: () {
                    if (currentPinCode.length == 6) {
                      pinCode = currentPinCode;
                      currentview = 2;
                      pinCodeController.clear();
                      Navigator.pop(context);
                      opensheet(context);
                    } else {
                      snackBar("Please fill all fields");
                    }
                  },
                  text: "Continue"),
            )
          ],
        ),
      ),
    );
  }

// ----------------- Modal Bottom Sheet (3) [ Reset Passwrd ] -----------------
  Widget resetPasswrd() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 244, 244),
          borderRadius: BorderRadius.circular(20)),
      height: 600,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height32,
            const Text(
              "Resest Password",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            height32,
            const Text(
              "Set the new password for your account so you can login.",
              style: TextStyle(fontSize: 16),
            ),
            height24,
            const Text("New Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            CustomTextField(
                hint: "Password",
                iconName: Icons.lock_outline,
                controller: newPasswordController,
                isPassword: true),
            height16,
            const Text("Confirm Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            CustomTextField(
                hint: "Re-type password",
                iconName: Icons.lock_outline,
                controller: confirmNewPasswordController,
                isPassword: true),
            height64,
            Center(
                child: CustomButton(
              text: "Reset Password",
              onPressed: () async {
                // ---------- update password response ----------
                if (newPasswordController.text ==
                    confirmNewPasswordController.text) {
                  // --- response
                  final response = await updatePassword(body: {
                    "email": email,
                    "code": pinCode,
                    "password": newPasswordController.text
                  });
                  print(response.body);

                  // --- if response is success
                  if (response.statusCode == 200) {
                    snackBar("Your password is updated successfully");
                    newPasswordController.clear();
                    confirmNewPasswordController.clear();

                    currentview = 0;
                    Navigator.pop(context);
                  } else {
                    snackBar(json.decode(response.body)["msg"]);
                  }
                } else {
                  snackBar("The password and confirm password doesn't match");
                }
              },
            ))
          ],
        ),
      ),
    );
  }

// ---------------------- [ Pin Code Text Field ] ----------------------
  Widget pinCodeTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
      child: PinCodeTextField(
        autoDisposeControllers: false,
        appContext: context,
        length: 6,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeColor: myTertiaryColor,
          inactiveColor: myTertiaryColor,
          selectedColor: primaryColor,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
        ),

        cursorColor: primaryColor,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: pinCodeController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],

        onCompleted: (v) {
          debugPrint("Completed");
        },
        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: (value) {
          currentPinCode = value;
        },
      ),
    );
  }
}

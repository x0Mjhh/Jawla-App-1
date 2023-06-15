import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jawla_app/components/button.dart';
import 'package:jawla_app/components/text_field.dart';
import 'package:jawla_app/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:jawla_app/extension/format.dart';
import 'package:jawla_app/services/api/auth/forget_password.dart';
import 'package:jawla_app/services/api/auth/update_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentview = 0;
  List<Widget> views = [];
  String email = "";
  String currentPinCode = "";
  String pinCode = "";

  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController(),
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
    confirmPasswordController.dispose();
    // pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("lib/assets/images/background.jpeg"),
          Center(
            child: InkWell(
              onTap: () {
                currentview = 0;
                opensheet(context);
              },
              child: const Text("Forget Paswword"),
            ),
          ),
        ],
      ),
    );
  }

// --------------- snack bar ---------------
  void opensheet(BuildContext context) {
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
          style: const TextStyle(color: myPrimaryColor, fontSize: 14),
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
                controller: emailController),
            height96,
            Center(
              child: CustomButton(
                  onPressed: () async {
                    if (emailController.text.isValidEmail) {
                      // ---------- forget password response ----------
                      final response = await forgetPassword(
                          body: {"email": emailController.text});
                      print(response.body);

                      if (response.statusCode == 200) {
                        email = emailController.text;
                        currentview = 1;
                        emailController.clear();

                        if (!mounted) return;
                        Navigator.pop(context);
                        opensheet(context);
                      } else {
                        snackBar(json.decode(response.body)["msg"]);
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
                iconName: Icons.password,
                controller: passwordController,
                isPassword: true),
            height16,
            const Text("Confirm Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            CustomTextField(
                hint: "Re-type password",
                iconName: Icons.password,
                controller: confirmPasswordController,
                isPassword: true),
            height64,
            Center(
                child: CustomButton(
                    onPressed: () async {
                      // ---------- update password response ----------
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        // response
                        final response = await updatePassword(body: {
                          "email": email,
                          "code": pinCode,
                          "password": passwordController.text
                        });
                        print(response.body);

                        // if response is success
                        if (response.statusCode == 200) {
                          snackBar("Your password is updated successfully");
                          passwordController.clear();
                          confirmPasswordController.clear();

                          currentview = 0;
                          Navigator.pop(context);
                        } else {
                          snackBar(json.decode(response.body)["msg"]);
                        }
                      } else {
                        snackBar(
                            "The password and confirm password doesn't match");
                      }
                    },
                    text: "Reset Password"))
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
          selectedColor: myPrimaryColor,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
        ),

        cursorColor: myPrimaryColor,
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

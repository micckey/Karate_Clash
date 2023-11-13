import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karateclash/configurations/custom_widgets.dart';
import 'package:karateclash/configurations/styles.dart';
import 'package:karateclash/views/dashboard.dart';

class LoginPage extends StatefulWidget {

  VoidCallback switchPagesFunction;

  LoginPage({ required this.switchPagesFunction, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Input Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Handle password visibility
  bool isHidden = false;
  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().mainColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/images/main_logo.png',
            height: 350,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyTextField(hintText: 'email', controller: emailController,
                    onChanged: (_) {}),
                const SizedBox(
                  height: 10,
                ),
                MyPasswordField(
                  hintText: 'password',
                    isHidden: isHidden, toggleVisibility: toggleVisibility),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const DashBoard());
                  },
                  child: Container(
                    height: 65,
                    width: double.maxFinite,
                    color: CustomColors().buttonColor,
                    child: Center(
                        child: MyTextWidget(
                      color: CustomColors().buttonTextColor,
                      text: 'LOGIN',
                      size: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextWidget(
                        text: 'Don\'t have an account?',
                        color: CustomColors().darkTextColor,
                        size: 18.0,
                        fontWeight: FontWeight.w400),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: widget.switchPagesFunction

                      ,
                      child: MyTextWidget(
                          text: 'Signup',
                          color: CustomColors().linkTextColor,
                          size: 20.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
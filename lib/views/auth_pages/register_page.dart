import 'package:flutter/material.dart';
import 'package:karateclash/configurations/custom_widgets.dart';
import 'package:karateclash/configurations/styles.dart';

class RegisterPage extends StatefulWidget {
  VoidCallback switchPagesFunction;

  RegisterPage({required this.switchPagesFunction, super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Input Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController clubController = TextEditingController();
  TextEditingController rankController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();

  //Handle password visibility
  bool isPasswordHidden = false;
  bool isConfirmationHidden = false;

  togglePasswordVisibility() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  toggleConfirmationVisibility() {
    setState(() {
      isConfirmationHidden = !isConfirmationHidden;
    });
  }

  //Moving to the next page
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void switchToNextPage() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  //Ensure user input before proceeding to next page
  bool canScrollToNextPage = false;

  void canProceedToNextPage() {
    if (firstNameController.text.toString().trim() != '' &&
        lastNameController.text.toString().trim() != '' &&
        emailController.text.toString().trim() != '' &&
        clubController.text.toString().trim() != '') {
      setState(() {
        canScrollToNextPage = true;
      });
    } else {
      setState(() {
        canScrollToNextPage = false;
      });
    }
  }

  //Dispose controllers
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    clubController.dispose();
    rankController.dispose();
    ageController.dispose();
    weightController.dispose();
    passwordController.dispose();
    confirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors().mainColor,
        body: PageView(
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          physics: canScrollToNextPage
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/kc_logo.png',
                          height: 250,
                        ),
                        MyTextWidget(
                            text: 'Fill in all fields to proceed',
                            color: CustomColors().darkTextColor,
                            size: 18.0,
                            fontWeight: FontWeight.w300),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                            hintText: 'firstname',
                            controller: firstNameController,
                            onChanged: (_) {
                              canProceedToNextPage();
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                            hintText: 'lastname',
                            controller: lastNameController,
                            onChanged: (_) {
                              canProceedToNextPage();
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                          hintText: 'email',
                          controller: emailController,
                          onChanged: (_) {
                            canProceedToNextPage();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                            hintText: 'club',
                            controller: clubController,
                            onChanged: (_) {
                              canProceedToNextPage();
                            }),
                        const SizedBox(
                          height: 50,
                        ),
                        IgnorePointer(
                          ignoring: canScrollToNextPage ? false : true,
                          child: GestureDetector(
                            onTap: switchToNextPage,
                            child: Container(
                              height: 65,
                              width: double.maxFinite,
                              color: canScrollToNextPage
                                  ? CustomColors().buttonColor
                                  : CustomColors().buttonColor.withOpacity(0.7),
                              child: Center(
                                  child: MyTextWidget(
                                color: CustomColors().buttonTextColor,
                                text: 'Next',
                                size: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextWidget(
                                text: 'Already have an account?',
                                color: CustomColors().darkTextColor,
                                size: 18.0,
                                fontWeight: FontWeight.w400),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: widget.switchPagesFunction,
                              child: MyTextWidget(
                                  text: 'Sign in',
                                  color: CustomColors().linkTextColor,
                                  size: 20.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(2, (pageIndicator) {
                            return Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 10,
                              width: currentIndex == pageIndicator ? 15 : 10,
                              decoration: BoxDecoration(
                                  color: currentIndex == pageIndicator
                                      ? CustomColors()
                                          .buttonColor
                                          .withOpacity(0.4)
                                      : CustomColors().distinctColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                            );
                          }),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        MyTextField(
                            hintText: 'rank',
                            controller: rankController,
                            onChanged: (_) {
                              canProceedToNextPage();
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                            hintText: 'age',
                            controller: ageController,
                            onChanged: (_) {
                              canProceedToNextPage();
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                            hintText: 'weight',
                            controller: weightController,
                            onChanged: (_) {
                              canProceedToNextPage();
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        MyPasswordField(
                            hintText: 'password',
                            isHidden: isPasswordHidden,
                            toggleVisibility: togglePasswordVisibility),
                        const SizedBox(
                          height: 10,
                        ),
                        MyPasswordField(
                            hintText: 'password confirmation',
                            isHidden: isConfirmationHidden,
                            toggleVisibility: toggleConfirmationVisibility),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 65,
                          width: double.maxFinite,
                          color: CustomColors().buttonColor,
                          child: Center(
                              child: MyTextWidget(
                            color: CustomColors().buttonTextColor,
                            text: 'REGISTER',
                            size: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextWidget(
                                text: 'Already have an account?',
                                color: CustomColors().darkTextColor,
                                size: 18.0,
                                fontWeight: FontWeight.w400),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: widget.switchPagesFunction,
                              child: MyTextWidget(
                                  text: 'Sign in',
                                  color: CustomColors().linkTextColor,
                                  size: 20.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 115,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(2, (pageIndicator) {
                            return Container(
                              margin: const EdgeInsets.only(left: 5),
                              height: 10,
                              width: currentIndex == pageIndicator ? 15 : 10,
                              decoration: BoxDecoration(
                                  color: pageIndicator == currentIndex
                                      ? CustomColors().distinctColor
                                      : CustomColors()
                                          .buttonColor
                                          .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10.0)),
                            );
                          }),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            )
          ],
        ));
  }
}

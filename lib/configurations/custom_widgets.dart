import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karateclash/configurations/styles.dart';
import 'package:karateclash/views/event_page.dart';

class MyTextField extends StatelessWidget {
  final onChanged;

  // final ValueChanged<String>? onChanged;
  TextEditingController controller;
  String hintText;

  MyTextField({
    required this.controller,
    required this.onChanged,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: CustomColors().distinctColor,
              blurRadius: 20,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0.5,
              offset: const Offset(5, 5))
        ],
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
              fillColor: CustomColors().secondaryColor,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}

class MyPasswordField extends StatelessWidget {
  final String hintText;
  bool isHidden;
  VoidCallback toggleVisibility;

  MyPasswordField({
    required this.hintText,
    required this.isHidden,
    required this.toggleVisibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: CustomColors().distinctColor,
              blurRadius: 20,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0.5,
              offset: const Offset(5, 5))
        ],
      ),
      child: Center(
        child: TextField(
          obscureText: isHidden ? false : true,
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: toggleVisibility,
                  child: isHidden
                      ? const Icon(CupertinoIcons.eye)
                      : const Icon(CupertinoIcons.eye_slash)),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const MyTextWidget({
    required this.text,
    required this.color,
    required this.size,
    required this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}

class HomePageCard extends StatelessWidget {
  final double containerHeight;
  final List imagePath;
  final String title;

  const HomePageCard({
    super.key,
    required this.containerHeight,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      width: double.maxFinite,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => const EventPage(eventType: 'Other'),
                  arguments: [imagePath[index]]);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath[index]), fit: BoxFit.fill),
                  color: CustomColors().cardColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Stack(children: [
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              CustomColors().cardColor.withOpacity(0.95),
                              CustomColors().buttonColor.withOpacity(0.85)
                            ])),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyTextWidget(
                              text: title,
                              color: CustomColors().lightTextColor,
                              size: 15.0,
                              fontWeight: FontWeight.w900),
                          MyTextWidget(
                              text: 'The Date',
                              color: CustomColors()
                                  .lightTextColor
                                  .withOpacity(0.7),
                              size: 13.0,
                              fontWeight: FontWeight.w600),
                        ]),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}

class CustomNavBarIcons extends StatelessWidget {
  Function() onTapMethod;
  final IconData icon;

  bool isActive;
  String imagePath;
  bool isIcon;

  CustomNavBarIcons({
    super.key,
    required this.onTapMethod,
    this.isIcon = true,
    this.imagePath = '',
    this.isActive = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapMethod();
      },
      child: isActive
          ? Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: CustomColors().mainColor,
                  borderRadius: BorderRadius.circular(35)),
              child: isIcon
                  ? Icon(
                      icon,
                      color: CustomColors().darkTextColor.withOpacity(0.7),
                      size: 30,
                    )
                  : Image.asset(
                      imagePath,
                    ),
            )
          : isIcon
              ? Icon(
                  icon,
                  color: isActive
                      ? CustomColors().buttonTextColor
                      : CustomColors().darkTextColor.withOpacity(0.7),
                  size: 30,
                )
              : Image.asset(imagePath),
    );
  }
}

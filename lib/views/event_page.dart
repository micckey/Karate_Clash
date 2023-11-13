import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karateclash/configurations/custom_widgets.dart';
import 'package:karateclash/configurations/styles.dart';

class EventPage extends StatefulWidget {

  final String eventType;

  const EventPage({super.key, required this.eventType});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<String> championshipsList = ['Kata', 'Kumite', 'Both'];
  List<String> championshipPriceList = ['700', '700', '1000'];

  final String imagePath = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: screenHeight * 0.45,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill)
                    ),
                  )),
              Positioned(
                left: 0,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                height: 45,
                      width: 50,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: CustomColors().buttonColor,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
                      ),
                      child: Image.asset('assets/images/arrow_back.png', color: CustomColors().buttonTextColor),
              ),
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: screenHeight * 0.55,
                    decoration: BoxDecoration(
                        color: CustomColors().mainColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        MyTextWidget(
                            text: 'BUDOKAN KARATE CHAMPIONSHIP',
                            color: CustomColors().darkTextColor,
                            size: 21.0,
                            fontWeight: FontWeight.bold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextWidget(
                                text: 'Organizers:',
                                color: CustomColors().darkTextColor,
                                size: 19.0,
                                fontWeight: FontWeight.w300),
                            const SizedBox(
                              width: 10,
                            ),
                            MyTextWidget(
                                text: 'Budokan',
                                color: CustomColors().darkTextColor,
                                size: 19.0,
                                fontWeight: FontWeight.w600)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextWidget(
                                text: 'Date:',
                                color: CustomColors().darkTextColor,
                                size: 17.0,
                                fontWeight: FontWeight.w300),
                            const SizedBox(
                              width: 10,
                            ),
                            MyTextWidget(
                                text: '9-12-2023',
                                color: CustomColors().darkTextColor,
                                size: 17.0,
                                fontWeight: FontWeight.w400)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: CustomColors().darkTextColor,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            MyTextWidget(
                                text: 'Machakos, Kenya',
                                color: CustomColors().darkTextColor,
                                size: 19.0,
                                fontWeight: FontWeight.w600)
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        widget.eventType == 'Tournament' ? Column(
                          children: [
                            MyTextWidget(
                                text: 'Select a championship below',
                                color: CustomColors().darkTextColor,
                                size: 17.0,
                                fontWeight: FontWeight.w500),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: screenWidth * 0.25,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      MyTextWidget(
                                          text: championshipsList[index],
                                          color: CustomColors().lightTextColor,
                                          size: 17.0,
                                          fontWeight: FontWeight.w500),
                                      MyTextWidget(
                                          text:
                                              'Ksh ${championshipPriceList[index]}',
                                          color: CustomColors().lightTextColor,
                                          size: 19.0,
                                          fontWeight: FontWeight.w500)
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
                        ) : Container(

                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: CustomColors().highlightColor,
                          ),
                          child: Column(
                            children: [
                              MyTextWidget(text: 'Contact organizers for further information', color: CustomColors().lightTextColor, size: 16.0, fontWeight: FontWeight.w500),
                              MyTextWidget(text: 'Tel: 0729751130', color: CustomColors().lightTextColor, size: 16.0, fontWeight: FontWeight.w500),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextWidget(
                                text: 'Description',
                                color: CustomColors().darkTextColor,
                                size: 19.0,
                                fontWeight: FontWeight.bold),
                            MyTextWidget(
                                text:
                                    'Participants showcase their skills in kata (form) and kumite (sparring), aiming to demonstrate exceptional technique and control.',
                                color: CustomColors().darkTextColor,
                                size: 16.0,
                                fontWeight: FontWeight.w300),
                          ],
                        ),

                      ],
                    ),
                  )),
              Positioned(
                bottom: 10,
                  right: 0,
                  left: 0,
                  child: Container(
                height: 65,
                margin: const EdgeInsets.symmetric(horizontal: 40,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors().buttonColor
                ),
                child: widget.eventType == 'Tournament' ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextWidget(
                        text: 'Book Now',
                        color: CustomColors().buttonTextColor,
                        size: 18.0,
                        fontWeight: FontWeight.w500),
                    Image.asset('assets/images/arrow.png', color: CustomColors().buttonTextColor,)
                  ],
                ) : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextWidget(
                        text: 'Confirm Attendance',
                        color: CustomColors().buttonTextColor,
                        size: 18.0,
                        fontWeight: FontWeight.w500),
                    const SizedBox(width: 10,),
                    Image.asset('assets/images/check.png', color: CustomColors().buttonTextColor, height: 40,)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

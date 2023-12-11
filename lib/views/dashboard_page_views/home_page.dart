import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karateclash/configurations/custom_widgets.dart';
import 'package:karateclash/configurations/styles.dart';
import 'package:karateclash/views/event_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageList = [
    'assets/images/referee.png',
    'assets/images/instructor.png',
    'assets/images/hiking.png'
  ];

  List<String> courseList = [
    'Referee n Coach Course',
    'Instructor Course',
    'Hiking n Bootcamp'
  ];

  List<String> gasshukuImagesList = [
    'assets/images/gasshuku.jpg',
    'assets/images/gasshuku3.jpg',
    'assets/images/gasshuku2.jpeg',
  ];

  List<String> gradingImagesList = [
    'assets/images/grading.jpeg',
    'assets/images/gasshuku2.jpeg',
    'assets/images/gasshuku.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;

    return Container(
      color: CustomColors().mainColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget(
                  text: 'Tournaments',
                  color: CustomColors().darkTextColor,
                  size: 20.0,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: screenHeight * 0.45,
                width: double.maxFinite,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, pageViewIndex) {
                    List<String> tournamentImagesList = [
                      'assets/images/tourn3.jpeg',
                      'assets/images/tourn4.jpeg',
                      'assets/images/tournament.jpg',
                      'assets/images/tourn2.jpg',
                    ];

                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: CustomColors().cardColor,
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        tournamentImagesList[pageViewIndex]),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                              colors: [
                                                CustomColors()
                                                    .cardColor
                                                    .withOpacity(0.8),
                                                CustomColors()
                                                    .buttonColor
                                                    .withOpacity(0.2)
                                              ])),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyTextWidget(
                                              text: 'Budokan Association',
                                              color:
                                                  CustomColors().darkTextColor,
                                              size: 21.0,
                                              fontWeight: FontWeight.w900),
                                          MyTextWidget(
                                              text: 'Date: 09-12-2023',
                                              color: CustomColors()
                                                  .darkTextColor
                                                  .withOpacity(0.7),
                                              size: 16.0,
                                              fontWeight: FontWeight.w900)
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    bottom: 30,
                                    left: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => const EventPage(
                                                eventType: 'Tournament'),
                                            arguments: [
                                              tournamentImagesList[
                                                  pageViewIndex]
                                            ]);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 80),
                                        height: 50,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: CustomColors()
                                                      .buttonColor,
                                                  spreadRadius: 1,
                                                  blurRadius: 0.5,
                                                  offset: const Offset(0, 2)),
                                              BoxShadow(
                                                  color:
                                                      CustomColors().cardColor,
                                                  spreadRadius: 1,
                                                  blurRadius: 0.5,
                                                  offset: const Offset(0, 2))
                                            ],
                                            color:
                                                CustomColors().secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(35)),
                                        child: Center(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MyTextWidget(
                                                text: 'Take a look',
                                                color: CustomColors()
                                                    .darkTextColor,
                                                size: 17.0,
                                                fontWeight: FontWeight.w800),
                                            Image.asset(
                                              'assets/images/arrow2.png',
                                              height: 40,
                                              width: 80,
                                              color:
                                                  CustomColors().darkTextColor,
                                            )
                                          ],
                                        )),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (indicatorIndex) {
                            return Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 10,
                              width: indicatorIndex == pageViewIndex ? 15 : 10,
                              decoration: BoxDecoration(
                                  color: indicatorIndex == pageViewIndex
                                      ? CustomColors().highlightColor
                                      : CustomColors()
                                          .highlightColor
                                          .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)),
                            );
                          }),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextWidget(
                  text: 'Gasshukus',
                  color: CustomColors().darkTextColor,
                  size: 20.0,
                  fontWeight: FontWeight.bold),
              HomePageCard(
                containerHeight: screenHeight * 0.265,
                imagePath: gasshukuImagesList,
                title: 'Shinji Akita Sensei',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextWidget(
                  text: 'Grading',
                  color: CustomColors().darkTextColor,
                  size: 20.0,
                  fontWeight: FontWeight.bold),
              HomePageCard(
                containerHeight: screenHeight * 0.265,
                imagePath: gradingImagesList,
                title: 'Budokan Grading',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextWidget(
                  text: 'Other Events',
                  color: CustomColors().darkTextColor,
                  size: 20.0,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 150,
                width: double.maxFinite,
                // color: CustomColors().cardColor,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: CustomColors().distinctColor,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(imageList[index], height: 100),
                          MyTextWidget(
                              text: courseList[index],
                              color: CustomColors().darkTextColor,
                              size: 15.0,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 90,
              )
            ],
          ),
        ),
      ),
    );
  }
}

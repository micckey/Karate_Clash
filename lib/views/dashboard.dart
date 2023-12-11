import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:karateclash/configurations/custom_widgets.dart';
import 'package:karateclash/configurations/styles.dart';
import 'package:karateclash/views/dashboard_drawer.dart';

import 'dashboard_page_views/history_page.dart';
import 'dashboard_page_views/home_page.dart';
import 'dashboard_page_views/results_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  PageController pageController = PageController(initialPage: 1);
  int currentIndex = 1;

  List navBarIcons = [
    Icons.history,
    Icons.home_filled,
    Icons.checklist_rtl_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().mainColor,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, color: CustomColors().secondaryColor),
          );
        }),
        flexibleSpace: Container(
          height: double.maxFinite,
          color: CustomColors().highlightColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextWidget(
                      text: 'Welcome back, Mike \u{1F44B}',
                      color: CustomColors().lightTextColor,
                      size: 23.0,
                      fontWeight: FontWeight.w400),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const DashboardDrawer(),
      body: Stack(children: [
        Positioned.fill(
          // bottom: 100,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: const [
              HistoryPage(),
              HomePage(),
              ResultsPage(),
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: double.maxFinite,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: CustomColors().highlightColor.withOpacity(0.45),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(3, (navIndex) {
                        return Expanded(
                          child: CustomNavBarIcons(
                            onTapMethod: () {
                              pageController.animateToPage(navIndex,
                                  duration: const Duration(microseconds: 1000),
                                  curve: Curves.ease);
                            },
                            icon: navBarIcons[navIndex],
                            isIcon: navIndex == 1 ? false : true,
                            imagePath: navIndex == 1
                                ? 'assets/images/home_icon.png'
                                : '',
                            isActive: currentIndex == navIndex ? true : false,
                          ),
                        );
                      })),
                ),
              ),
            ))
      ]),
    );
  }
}

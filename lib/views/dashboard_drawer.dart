import 'package:flutter/material.dart';
import 'package:karateclash/configurations/styles.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(

      backgroundColor: CustomColors().highlightColor,
    );
  }
}

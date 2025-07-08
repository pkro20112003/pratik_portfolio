import 'package:flutter/material.dart';

import 'package:pratik_portfolio/Utils/globals.dart';
import 'package:pratik_portfolio/view/home/components/blog_enjo.dart';
import 'package:pratik_portfolio/view/home/components/education.dart';
import 'package:pratik_portfolio/view/home/components/healtheltic.dart';
import 'package:pratik_portfolio/view/home/components/c_v_section.dart';
import 'package:pratik_portfolio/view/home/components/carousel.dart';

import 'package:pratik_portfolio/view/home/components/header.dart';
import 'package:pratik_portfolio/view/home/components/info.dart';
import 'package:pratik_portfolio/view/home/components/skill.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: mobileDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(),
              Container(key: Globals.homeKey, child: Carousel()),
              SizedBox(height: 40),
              Container(key: Globals.cvKey, child: CVSection()),
              Container(key: Globals.healthleticKey, child: Healthletic()),
              SizedBox(height: 20),
              BlogEnjo(),
              SizedBox(height: 20),
              Container(key: Globals.educationKey, child: Education()),
              SizedBox(height: 20),
              Container(key: Globals.skillKey, child: Skill()),
              SizedBox(height: 40),
              Container(key: Globals.infoKey, child: Info()),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

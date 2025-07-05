import 'package:flutter/material.dart';

import 'package:pratik_portfolio/Utils/globals.dart';
import 'package:pratik_portfolio/view/home/components/c_v_section.dart';
import 'package:pratik_portfolio/view/home/components/carousel.dart';

import 'package:pratik_portfolio/view/home/components/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: mobileDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Header(), Carousel(), SizedBox(height: 40), CVSection()],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:pratik_portfolio/Utils/globals.dart';
import 'package:pratik_portfolio/page/home/components/carousel.dart';

import 'package:pratik_portfolio/page/home/components/header.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: mobileDrawer(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Header(), Carousel()],
        ),
      ),
    );
  }
}

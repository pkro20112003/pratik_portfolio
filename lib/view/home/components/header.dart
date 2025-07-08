import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/globals.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';
import 'package:pratik_portfolio/Utils/url.dart';
import 'package:pratik_portfolio/models/header_item.dart';
import 'package:pratik_portfolio/view/home/home.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

List<HeaderItem> hearderItem = [
  HeaderItem(
    name: "HOME",
    ontap: () {
      Home().scrollTo(Globals.homeKey);
    },
  ),
  HeaderItem(
    name: "MY INTRO",
    ontap: () {
      Home().scrollTo(Globals.cvKey);
    },
  ),
  HeaderItem(
    name: "PROJECTS",
    ontap: () {
      Home().scrollTo(Globals.healthleticKey);
    },
  ),
  HeaderItem(
    name: "EDUCATION",
    ontap: () {
      Home().scrollTo(Globals.educationKey);
    },
  ),
  HeaderItem(
    name: "SKILLS",
    ontap: () {
      Home().scrollTo(Globals.skillKey);
    },
  ),
  HeaderItem(
    name: "CONTACTS",
    ontap: () {
      Home().scrollTo(Globals.infoKey);
    },
  ),
  HeaderItem(
    name: "HIRE ME",
    ontap: () {
      try {
        launchUrl(email);
      } on SocketException {
        CircularNotchedRectangle();
      } catch (e) {
        debugPrint(e.toString());
      }
    },
    isbutton: true,
  ),
];

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "P",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: GoogleFonts.oswald(
                      color: hPrimaryColor,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleConditions: [Condition.largerThan(name: MOBILE)],
      child: Row(
        children:
            hearderItem
                .map(
                  (item) =>
                      item.isbutton
                          ? MouseRegion(
                            cursor: SystemMouseCursors.click,

                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: hDangerColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextButton(
                                onPressed: item.ontap,
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                          : MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: GestureDetector(
                                onTap: item.ontap,
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                )
                .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScreenHelper(
        Padding(padding: EdgeInsets.all(10), child: buildHeaderMobile()),
        buildHeader(),
        Padding(padding: EdgeInsets.all(20), child: buildHeader()),
      ),
    );
  }
}

Widget mobileDrawer() {
  return Drawer(
    backgroundColor: hBackgroundColor,
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return hearderItem[index].isbutton
                ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hDangerColor,
                    ),
                    onPressed: hearderItem[index].ontap,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        hearderItem[index].name,
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                )
                : MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: hearderItem[index].ontap,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        hearderItem[index].name,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                );
          },
          separatorBuilder:
              (BuildContext context, int index) => SizedBox(height: 18),
          itemCount: hearderItem.length,
        ),
      ),
    ),
  );
}

Widget buildHeaderMobile() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      HeaderLogo(),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Globals.scaffoldKey.currentState?.openEndDrawer();
          },
          child: Icon(Typicons.menu, color: Colors.white),
        ),
      ),
    ],
  );
}

Widget buildHeader() {
  return Container(
    padding: EdgeInsets.symmetric(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [HeaderLogo(), HeaderRow()],
    ),
  );
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';
import 'package:pratik_portfolio/Utils/url.dart';
import 'package:pratik_portfolio/models/education_list_model.dart';
import 'package:pratik_portfolio/models/experience_list_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Education extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScreenHelper(
        buildUI(context, MediaQuery.of(context).size.width * .8),
        buildUI(context, 800),
        buildUI(context, 1000),
      ),
    );
  }

  final List<EducationListModel> edulist = [
    EducationListModel(
      standard: "B.Tech (Information Technology) ",
      institution: "Government Engineering College, Jagdalpur",
      duration: "2022-present",
      marks: "currently Studying",
    ),
    EducationListModel(
      standard: "Computer Operator and Programming Assistant",
      institution: "Government Industrial Training Institute, Durg",
      duration: "2021-22",
      marks: "89%",
    ),
    EducationListModel(
      standard: "Higher Secondary School Certificate Examination (12TH)",
      institution: "Swami Atmananda Government English Medium School, Nagpura",
      duration: "2020-21",
      marks: "95.8%",
    ),
    EducationListModel(
      standard: "High School Certificate Examination (10TH)",
      institution: "Confluence Academic School",
      duration: "2018-19",
      marks: "92.8",
    ),
  ];
  final List<ExperienceListModel> exList = [
    ExperienceListModel(
      isLink: true,
      duration: "July 2024 - August 2024",
      company: "Zidio Development PVT LTD",
      description:
          "Achievement: Recognized as Intern of the Month for outstanding contributions in mobile app development at Zidio Development. Demonstrated strong proficiency in Flutter, collaborated effectively with cross-functional teams, and delivered high-quality features with a focus on performance, UI/UX, and scalability.",
    ),
    ExperienceListModel(
      isLink: true,
      duration: "January 2025 - April 2025",
      company: "Healthletic Lifestyle",
      description:
          "Led mobile app development(as Intern) at Healthletic Lifestyle, overseeing the design and implementation of key features using Flutter. Collaborated with UI/UX teams, ensured app performance and responsiveness, and guided developers to deliver a seamless user experience focused on health and fitness.",
    ),
    ExperienceListModel(
      duration: "June 2025 - present",
      company: "Khodal Tech",
      description:
          "Working as a Flutter intern at Khodal Tech, contributing to the development of cross-platform mobile applications. Involved in building responsive UIs, integrating APIs, and ensuring smooth performance across devices under the guidance of senior developers.",
    ),
  ];
  Widget buildUI(BuildContext context, double width) {
    return Container(
      constraints: BoxConstraints(minWidth: width, maxWidth: width),
      child: Flex(
        direction:
            ScreenHelper.isDesktop(context) ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                child: Text(
                  "Education",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.oswald(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(
                  maxWidth:
                      ScreenHelper.isDesktop(context)
                          ? 450
                          : MediaQuery.of(context).size.width * .8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      edulist
                          .map(
                            (list) => SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    list.duration,
                                    style: GoogleFonts.oswald(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    list.standard,
                                    style: GoogleFonts.oswald(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    list.institution,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: hPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    list.marks,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: hPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Experience",
                style: GoogleFonts.oswald(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children:
                    exList
                        .map(
                          (list) => Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  ScreenHelper.isDesktop(context)
                                      ? 450
                                      : MediaQuery.of(context).size.width * .8,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list.duration,
                                  style: GoogleFonts.oswald(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      list.company,
                                      style: GoogleFonts.oswald(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    list.isLink
                                        ? MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: TextButton(
                                            onPressed: () {
                                              try {
                                                list.company ==
                                                        "Zidio Development PVT LTD"
                                                    ? launchUrl(zidio_url)
                                                    : launchUrl(
                                                      healthletic_url,
                                                    );
                                              } on SocketException {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      "Network Error",
                                                    ),
                                                    backgroundColor:
                                                        hCaptionColor,
                                                  ),
                                                );
                                              } catch (e) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      "Can't launch Url.",
                                                    ),
                                                    backgroundColor:
                                                        hCaptionColor,
                                                  ),
                                                );
                                              }
                                            },
                                            child: Text(
                                              "Link",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: hDangerColor,
                                              ),
                                            ),
                                          ),
                                        )
                                        : SizedBox(),
                                  ],
                                ),
                                Text(
                                  list.description,
                                  style: GoogleFonts.oswald(
                                    fontSize: 16,
                                    color: hPrimaryColor,
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

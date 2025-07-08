import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';
import 'package:pratik_portfolio/models/skill_list_model.dart';

class Skill extends StatelessWidget {
  final List<SkillListModel> skillList = [
    SkillListModel(skill: "Flutter & Dart", percentage: 70),
    SkillListModel(skill: "FireBase Integration", percentage: 75),
    SkillListModel(skill: "RESTful API Integration", percentage: 65),
    SkillListModel(skill: "Responsive UI Design", percentage: 60),
    SkillListModel(skill: "Version Control(Git)", percentage: 80),
  ];
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        _buildUI(context, MediaQuery.of(context).size.width * .8),
        _buildUI(context, 800),
        _buildUI(context, 1000),
      ),
    );
  }

  Widget _buildUI(BuildContext context, double width) {
    return Container(
      constraints: BoxConstraints(maxWidth: width),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction:
            ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth:
                  ScreenHelper.isMobile(context)
                      ? 400
                      : MediaQuery.of(context).size.width * .3,
            ),
            child: Image.asset("assets/images/profile_pic.jpg"),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth:
                  ScreenHelper.isMobile(context)
                      ? 400
                      : MediaQuery.of(context).size.width * .3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "skills: ",
                  style: GoogleFonts.oswald(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "The following is the list of skills, and more will be updated soon.",
                  style: TextStyle(fontSize: 15, color: hPrimaryColor),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      skillList
                          .map(
                            (list) => Container(
                              margin: EdgeInsets.only(bottom: 10),
                              color: Colors.white,
                              height: 30,
                              width: ((list.percentage * 400) / 100),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    list.skill,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: hBackgroundColor,
                                    ),
                                  ),
                                  Text(
                                    list.percentage.toString() + "%",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: hBackgroundColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

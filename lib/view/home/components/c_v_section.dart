import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';

class CVSection extends StatelessWidget {
  const CVSection({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScreenHelper(
        buildUI(context, MediaQuery.of(context).size.width * .8),
        buildUI(context, 800.0),
        buildUI(context, 1000.0),
      ),
    );
  }
}

Widget buildUI(BuildContext context, double width) {
  return Container(
    constraints: BoxConstraints(maxWidth: width),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "BETTER DESIGN \nBETTER EXPERIENCE",
              style: GoogleFonts.oswald(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: hDangerColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Download CV",
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        //  Container(child: ,)
      ],
    ),
  );
}

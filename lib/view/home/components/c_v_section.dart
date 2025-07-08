import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';
import 'package:pratik_portfolio/Utils/url.dart';
import 'package:pratik_portfolio/models/design_process.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

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

final List<DesignProcess> designprocess = [
  DesignProcess(
    imagePath: "assets/images/design_logo.png",
    subtitle:
        "Design is the blueprint where imagination meets structure — the foundation every developer builds upon.",
  ),
  DesignProcess(
    imagePath: "assets/images/develop_logo.png",
    subtitle:
        "Develop is where ideas transform into reality — turning design into interactive, functional experiences.",
  ),
  DesignProcess(
    imagePath: "assets/images/write_logo.png",
    subtitle:
        "Write is the voice of creation — shaping thoughts into words that inspire, inform, and connect.",
  ),
  DesignProcess(
    imagePath: "assets/images/promote_logo.png",
    subtitle:
        "Promote is the bridge between creation and audience — turning value into visibility.",
  ),
];

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
            GestureDetector(
              onTap: () {
                try {
                  launchUrl(c_v_url);
                } on SocketException {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Network Error."),
                      backgroundColor: hCaptionColor,
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Cant't launch Url"),
                      backgroundColor: hCaptionColor,
                    ),
                  );
                }
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: hDangerColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Get Resume",
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        SizedBox(
          child: LayoutBuilder(
            builder:
                (context, constraints) => ResponsiveGridView.builder(
                  shrinkWrap: true,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  gridDelegate: ResponsiveGridDelegate(
                    maxCrossAxisExtent:
                        ScreenHelper.isMobile(context) ||
                                ScreenHelper.isTablet(context)
                            ? constraints.maxWidth / 2
                            : 250,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio:
                        ScreenHelper.isDesktop(context)
                            ? 1
                            : MediaQuery.of(context).size.aspectRatio * 1.5,
                  ),
                  itemBuilder:
                      (context, index) => Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Image(
                                image: AssetImage(
                                  designprocess[index].imagePath,
                                ),
                              ),
                            ),
                            Text(
                              designprocess[index].subtitle,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 12,
                                color: hPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                  itemCount: 4,
                ),
          ),
        ),
      ],
    ),
  );
}

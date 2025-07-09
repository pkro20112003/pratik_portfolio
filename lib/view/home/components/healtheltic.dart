import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';

class Healthletic extends StatelessWidget {
  const Healthletic({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      buildUI(context, MediaQuery.of(context).size.width * .8),
      buildUI(context, 800.0),
      buildUI(context, 1000.0),
    );
  }

  Widget buildUI(BuildContext context, double width) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width, minWidth: width),
      child: Flex(
        direction:
            ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .8,
              minHeight: 400,
            ),
            child: Center(child: Image.asset("assets/images/healthletic.png")),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .6,
              minHeight: 400,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Healthletic lifeStyle",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  constraints: BoxConstraints(
                    maxWidth:
                        ScreenHelper.isDesktop(context)
                            ? 400
                            : ScreenHelper.isTablet(context)
                            ? 300
                            : 600,
                    minWidth: 300,
                  ),
                  child: Text(
                    "Healthletic is a mobile application focused on promoting healthier lifestyles through personalized fitness and wellness tracking. As the Mobile Team Lead, I led the integration of the login and profile pages, ensuring secure authentication and seamless user experience. My role involved managing implementation, coordinating with backend services, and optimizing UI for performance across devices.",
                    style: TextStyle(
                      fontSize: 14,
                      color: hPrimaryColor,
                      height: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: hDangerColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("App will be launching soon."),
                          backgroundColor: hCaptionColor,
                        ),
                      );
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        child: Text(
                          "Get Details",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

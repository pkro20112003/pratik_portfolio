import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';
import 'package:pratik_portfolio/Utils/url.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogEnjo extends StatelessWidget {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BlogEnjo",
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
                    "BlogEnjo is a sleek and modern blogging app built using Flutter, designed to offer a smooth reading and writing experience across platforms. The app features a clean UI, rich text support, and real-time post updates, making content creation and discovery seamless.",
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
                      try {
                        launchUrl(blogenjo_url);
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
                            content: Text("Can't launch Url."),
                            backgroundColor: hCaptionColor,
                          ),
                        );
                      }
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
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .8,
              minHeight: 400,
            ),
            child: Center(child: Image.asset("assets/images/blogenjo.png")),
          ),
        ],
      ),
    );
  }
}

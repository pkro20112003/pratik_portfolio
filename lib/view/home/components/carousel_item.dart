import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/url.dart';
import 'package:pratik_portfolio/models/carousel_item_model.dart';
import 'package:url_launcher/url_launcher.dart';

List<CarouselItemModel> carouselItem =
    List.generate(
      5,
      (index) => CarouselItemModel(
        text: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FLUTTER DEVELOPER",
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: hPrimaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Pratik Rao",
                style: GoogleFonts.oswald(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "A cross platform app developer, based on India",
                style: GoogleFonts.oswald(
                  color: hPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Need your fully custom App",
                style: GoogleFonts.oswald(
                  color: hPrimaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hDangerColor,
                  ),
                  onPressed: () {
                    try {
                      launchUrl(email);
                    } on SocketException {
                      CircularNotchedRectangle();
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 30,
                      ),
                      child: Text(
                        "Get Started",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.oswald(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        try {
                          launchUrl(email);
                        } on SocketException {
                          CircularNotchedRectangle();
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CircleAvatar(
                          backgroundColor: hBackgroundColor,
                          maxRadius: 24,
                          minRadius: 16,
                          child: Image.asset(
                            "assets/images/email.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          launchUrl(linkedin_url);
                        } on SocketException {
                          CircularNotchedRectangle();
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CircleAvatar(
                          backgroundColor: hBackgroundColor,
                          maxRadius: 24,
                          minRadius: 16,
                          child: Image.asset(
                            "assets/images/linkdin.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          launchUrl(git_hub_url);
                        } on SocketException {
                          CircularNotchedRectangle();
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CircleAvatar(
                          backgroundColor: hBackgroundColor,
                          maxRadius: 24,
                          minRadius: 16,
                          child: Image.asset(
                            "assets/images/github.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        image: Container(
          constraints: BoxConstraints(maxHeight: 600, minHeight: 200),
          child: Image(
            image: AssetImage("assets/images/profile_pic.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ).toList();

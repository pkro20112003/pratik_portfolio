import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';
import 'package:pratik_portfolio/models/info_list_model.dart';

class Info extends StatelessWidget {
  final List<InfoListModel> info = [
    InfoListModel(
      logoPath: "assets/images/location.png",
      heading: "Address",
      value: "Bhilai, Durg, Chhattisgarh, India",
    ),
    InfoListModel(
      logoPath: "assets/images/email.png",
      heading: "Email-Id",
      value: "pkro2003@gmail.com",
    ),
    InfoListModel(
      logoPath: "assets/images/linkdin.png",
      heading: "Linkedin",
      value: "https://www.linkedin.com/in/pratik-rao2003/",
    ),
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
      constraints: BoxConstraints(maxWidth: width, minWidth: width),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        direction:
            ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
        children:
            info
                .map(
                  (list) => Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(maxWidth: 40),
                              child: Image.asset(list.logoPath),
                            ),
                            SizedBox(width: 10),
                            Text(
                              list.heading,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Text(
                            list.value,
                            style: TextStyle(
                              fontSize: 18,
                              color: hPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratik_portfolio/Utils/app_colors.dart';
import 'package:pratik_portfolio/page/home/home.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pratik's Portfolio",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: hBackgroundColor,
        primaryColor: hPrimaryColor,
        canvasColor: hBackgroundColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder:
          (BuildContext context, Widget? child) =>
              ResponsiveBreakpoints.builder(
                child: child!,
                debugLog: !kReleaseMode,
                breakpoints: const <Breakpoint>[
                  Breakpoint(start: 0, end: 450, name: 'MOBILE'),
                  Breakpoint(start: 451, end: 1000, name: 'TABLET'),
                  Breakpoint(start: 1001, end: 1200, name: 'DESKTOP'),
                  Breakpoint(start: 1201, end: 2460, name: '4K'),
                ],
              ),

      home: Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v201_detay_sayfasi_lanscape_modu/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("My App build");
    return ScreenUtilInit(
      designSize: Size(412, 732),
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        home: HomePage(),
      ),
    );
  }
}

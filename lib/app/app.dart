import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text_theme.dart';
import '../core/widgets/gradient_background.dart';
import '../features/app/presentation/pages/my_pages.dart';

/// The root widget of the app.
/// Displays the main page and manages app-wide theme settings.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // Main MaterialApp with theme configurations and home screen setup
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: Colors.blue,
        textTheme: appTextTheme,
        extensions: [
          AppGradientTheme(
            defaultGradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryWhite,
                AppColors.backgroundLightBlue,
              ],
            ),
          ),
        ],
      ),

      // Render the main pages of the app
      home: MyPages(
        key: MyPages.globalKey,
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/modelView/Auth/Dashboard/home_controller.dart';
import 'package:meettown/modelView/Auth/auth_controller.dart';
import 'package:meettown/modelView/Auth/completed_profile_controller.dart';
import 'package:meettown/modelView/Auth/login_controller.dart';
import 'package:meettown/modelView/Auth/otp_controller.dart';
import 'package:meettown/modelView/Auth/sign_up_controller.dart';
import 'package:meettown/modelView/Filter/search_match_by_interest_controller.dart';
import 'package:meettown/modelView/Filter/trip_filter_controller.dart';
import 'package:meettown/modelView/Services/splash_controller.dart';
import 'package:meettown/res/user_profile.dart';
import 'package:meettown/view/splash_view.dart';
import '../../res/appcolors.dart';
import 'package:provider/provider.dart';

import 'modelView/Auth/password_visibility_controller.dart';
import 'modelView/Filter/cardSwip_controller.dart';
import 'modelView/Filter/location_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordVisibilityModel()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => SignUpController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => CompletedProfileController()),
        ChangeNotifierProvider(create: (_) => ContactModel()),
        ChangeNotifierProvider(create: (_) => OTpController()),
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
        ChangeNotifierProvider(create: (_) => LocationController()),
        ChangeNotifierProvider(create: (_) => SearchUserByInterestController()),
        ChangeNotifierProvider(create: (_) => CardSwipeController()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: appColors.appBgColor,
          // scaffoldBackgroundColor: appColors.appBgColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            foregroundColor: appColors.textPrimaryColor,
            iconTheme: IconThemeData(color: appColors.iconPrimaryColor),
          ),
          textTheme:  TextTheme(
            labelLarge: TextStyle(color: Colors.white),
            displayLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: appColors.textSecondaryColor), // Example headline1 style
            displayMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: appColors.textBlueColor), // Example headline1 style
            // bodyText1: TextStyle(
            //     fontSize: 16, color: Colors.black87), // Default text color
          ),
          iconTheme: IconThemeData(color: appColors.buttonTextPrimaryColor),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            labelStyle:
                const TextStyle(color: appColors.primaryInputFieldBorder),
            // Define your TextInputField style here
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: appColors.primaryInputFieldBorder), // Border color
              borderRadius: BorderRadius.circular(30.0), // Border radius
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: appColors.primaryInputFieldBorder), // Border color
              borderRadius: BorderRadius.circular(30.0), // Border radius
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: appColors
                      .primaryInputFieldBorder), // Focused border color
              borderRadius: BorderRadius.circular(30.0), // Border radius
            ),
            // You can define more styles here as needed
          ),
        ),
        home: SplashView(),
        // home: CustomNavbar(),
      ),
    );
  }
}

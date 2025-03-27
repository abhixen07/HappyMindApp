import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'app/style/style.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      ///display page
      routerDelegate: AppRoutes.instance.router.routerDelegate,
      ///parse into meaningful format
      routeInformationParser: AppRoutes.instance.router.routeInformationParser,
      /// knows current route
      routeInformationProvider: AppRoutes.instance.router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Happy Mind App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: whiteColor,
        ///apply font  on light mode
        textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'OpenSans'
        ),

        appBarTheme:
        const AppBarTheme(color: whiteColor, surfaceTintColor: Colors.transparent),

        /// Global Button Theme for TextButton
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle().copyWith(
            backgroundColor: const WidgetStatePropertyAll(lightGreenColor),
            foregroundColor: const WidgetStatePropertyAll(whiteColor),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            ),
            side: WidgetStatePropertyAll(
              const BorderSide(color: Colors.transparent, width: 2),
            ),

            textStyle: const WidgetStatePropertyAll(
              TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),

            ///for size on screen
            minimumSize: WidgetStatePropertyAll(
                Size(MediaQuery.sizeOf(context).width, 55)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        /// Global Button Theme for ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle().copyWith(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: const WidgetStatePropertyAll(lightGreenColor),
            foregroundColor: const WidgetStatePropertyAll(whiteColor),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            ),
            textStyle: const WidgetStatePropertyAll(
              TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            minimumSize: WidgetStatePropertyAll(
                Size(MediaQuery.sizeOf(context).width, 48)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle().copyWith(
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            foregroundColor: const WidgetStatePropertyAll(lightGreenColor),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            ),
            textStyle: const WidgetStatePropertyAll(
              TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            minimumSize: WidgetStatePropertyAll(
                Size(MediaQuery.sizeOf(context).width, 48)),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
        useMaterial3: true,
      ),
    );
  }
}

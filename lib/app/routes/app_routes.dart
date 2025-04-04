import 'package:go_router/go_router.dart';
import 'package:happymindapp/views/appointment/appointment_page.dart';
import 'package:happymindapp/views/navbar/navbar_home.dart';

import '../../views/auth/login_view.dart';
import '../../views/auth/signup_view.dart';
import '../../views/splashscreen/onboarding_page.dart';
import '../../views/splashscreen/splash_screen.dart';


final class AppRoutes {
  AppRoutes._();

  static final instance = AppRoutes._();

  ///splash const
  static const String splashPage = "/";
  static const String onBoardPage = "/onboardpage";

  ///Auth Pages
  static const String loginpage = "/loginpage";
  static const String signuppage = "/signuppage";

  static const String navbarpage = "/navbarpage";

  static const String appointmentpage = "/appointmentpage";




  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: splashPage,
      name: NamedRoutes.splashPage.name,
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      path: onBoardPage,
      name: NamedRoutes.onBoardPage.name,
      builder: (context, state) => OnboardingPage(),
    ),

    GoRoute(
      path: loginpage,
      name: NamedRoutes.loginpage.name,
      builder: (context, state) => LoginPage(),
    ),

    GoRoute(
      path: signuppage,
      name: NamedRoutes.signuppage.name,
      builder: (context, state) => SignUpPage(),
    ),

    GoRoute(
      path: navbarpage,
      name: NamedRoutes.navbarpage.name,
      builder: (context, state) => NavBarHomePage(),
    ),

    GoRoute(
      path: appointmentpage,
      name: NamedRoutes.appointmentpage.name,
      builder: (context, state) => SelectDateTimePage(),
    ),




  ]);
}

/// Enum for page names to avoid using plain strings
enum NamedRoutes {
  splashPage,
  onBoardPage,
  loginpage,
  signuppage,
  navbarpage,
  appointmentpage

}

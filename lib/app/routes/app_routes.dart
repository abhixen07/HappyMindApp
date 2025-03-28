import 'package:go_router/go_router.dart';

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




  ]);
}

/// Enum for page names to avoid using plain strings
enum NamedRoutes {
  splashPage,
  onBoardPage,
  loginpage,
  signuppage,
}

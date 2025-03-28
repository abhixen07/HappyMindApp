import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../app/customwidget/custom_text_field.dart';
import '../../app/routes/app_routes.dart';
import '../../app/style/style.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///focus node nd controller of text fields

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///for button color enable or disable
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
          body: ListView(
              padding: EdgeInsets.only(
                top: screenWidth * 0.16,
                  left: screenWidth * 0.06, right: screenWidth * 0.06),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/app_logo.png'),
                    SizedBox(height: screenHeight * 0.04),

                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: darkGreenColor,
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Welcome back! Please enter your details.',
                      style: TextStyle(
                        color: customGreyColor,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    /// Email Address Field
                    CustomTextFormField(
                      controller: emailController,
                      currentFocusNode: emailFocusNode,
                      nextFocusNode: passwordFocusNode,
                      hintText: 'Enter Your Email',
                      label: 'Email',
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    /// Password Field
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Enter Your Password',
                      currentFocusNode: passwordFocusNode,
                      label: 'Password',
                      obscureText: true,
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    ///Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () { },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: darkGreenColor,
                              fontSize: screenWidth * 0.038,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.08),

                    /// Sign in Button
                    TextButton(onPressed: (){},
                        child: Text('Sign In')
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    /// Continue with Google & Facebook
                    Text(
                      'OR',
                      style: TextStyle(fontSize: 18, color:customGreyColor,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: lightGreyColor),
                          ),
                          child: SvgPicture.asset('assets/svg/fb_svg.svg',height: 40,),),
                        SizedBox(width: screenWidth*0.07),
                        Container(
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: lightGreyColor),
                          ),
                          child: SvgPicture.asset('assets/svg/google_svg.svg',height: 33,),),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.2,
              right: screenWidth * 0.2,
              top: screenHeight * 0.01,
              bottom: screenHeight * 0.06,
            ),
            child: RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  color: customGreyColor,
                  fontSize: screenWidth * 0.04,
                ),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                      color: lightGreenColor,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
                    ),

                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        GoRouter.of(context).pushNamed((NamedRoutes.signuppage.name));
                      },
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
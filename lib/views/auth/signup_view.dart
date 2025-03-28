import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../app/customwidget/custom_text_field.dart';
import '../../app/routes/app_routes.dart';
import '../../app/style/style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ///focus node nd controller of text fields
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode mobileFocusNode = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  ///for button color enable or disable
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_checkFields);
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
          backgroundColor: whiteColor,
          body: ListView(
            padding: EdgeInsets.only(
                top: screenWidth * 0.16,bottom: screenWidth * 0.1,
                left: screenWidth * 0.06, right: screenWidth * 0.06),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/app_logo.png'),
                    SizedBox(height: screenHeight * 0.04),

                    Text(
                      'Create New Account',
                      style: TextStyle(
                        color: darkGreenColor,
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    /// Full Name Field
                    CustomTextFormField(
                      controller: nameController,
                      currentFocusNode: nameFocusNode,
                      nextFocusNode: emailFocusNode,
                      hintText: 'Enter You Name',
                      label: 'Full Name',
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    /// Email Address Field
                    CustomTextFormField(
                      controller: emailController,
                      currentFocusNode: emailFocusNode,
                      nextFocusNode: passwordFocusNode,
                      hintText: 'Enter email address',
                      label: 'Email',
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    /// Password Field
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Enter password',
                      currentFocusNode: passwordFocusNode,
                      nextFocusNode: mobileFocusNode,
                      label: 'Password',
                      obscureText: true,
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    /// Mobile Number Field
                    CustomTextFormField(
                      controller: mobileController,
                      hintText: 'Enter Your Mobile Number',
                      currentFocusNode: mobileFocusNode,
                      label: 'Mobile Number',
                    ),

                    SizedBox(height: screenHeight * 0.05),

                    /// Create Account
                    TextButton(onPressed: (){}, child: Text('Sign Up')),
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
                    SizedBox(height: screenHeight * 0.02),
                    RichText(
                      text: TextSpan(
                        text: "If you have an account? ",
                        style: TextStyle(
                          color: customGreyColor,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: lightGreenColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'OpenSans',
                              fontSize: screenWidth * 0.04,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(context)
                                    .pushNamed((NamedRoutes.loginpage.name));
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
        );
  }
}
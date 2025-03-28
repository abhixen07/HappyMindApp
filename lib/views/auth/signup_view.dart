import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: greyColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.04, right: screenWidth * 0.04),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create account',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Welcome to MeMorialApp',
                      style: TextStyle(
                        color: greyColor,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    /// Full Name Field
                    CustomTextFormField(
                      controller: nameController,
                      currentFocusNode: nameFocusNode,
                      nextFocusNode: emailFocusNode,
                      hintText: 'Enter full name',
                      label: 'Full Name',
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    /// Email Address Field
                    CustomTextFormField(
                      controller: emailController,
                      currentFocusNode: emailFocusNode,
                      nextFocusNode: passwordFocusNode,
                      hintText: 'Enter email address',
                      label: 'Email',
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    /// Password Field
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Enter password',
                      currentFocusNode: passwordFocusNode,
                      label: 'Password',
                      obscureText: true,
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    /// Create Account
                    TextButton(onPressed: (){}, child: Text('Sign Up')),
                    SizedBox(height: screenHeight * 0.04),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.24,
              vertical: screenHeight * 0.03,
            ),
            child: RichText(
              text: TextSpan(
                text: "If you have an account? ",
                style: TextStyle(
                  color: greyColor,
                  fontSize: screenWidth * 0.035,
                ),
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyle(
                      color: darkGreenColor,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.035,
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
          ),
        );
      },
    );
  }
}
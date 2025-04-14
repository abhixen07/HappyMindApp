import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../app/customwidget/custom_text_field.dart';
import '../../app/routes/app_routes.dart';
import '../../app/style/style.dart';
import '../../viewmodel/login_view_model.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final loginViewModel = Get.put(LoginViewModel());
  final formKey = GlobalKey<FormState>();

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
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/svg/app_logo_svg.svg',height: screenHeight*0.08,),
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
                        controller: loginViewModel.emailController.value,
                        currentFocusNode: loginViewModel.emailFocusNode.value,
                        nextFocusNode: loginViewModel.passwordFocusNode.value,
                        hintText: 'Enter Your Email',
                        label: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Email';
                          }
                          if (!EmailValidator.validate(loginViewModel.emailController.value.text)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      /// Password Field
                      CustomTextFormField(
                        controller: loginViewModel.passwordController.value,
                        hintText: 'Enter Your Password',
                        currentFocusNode: loginViewModel.passwordFocusNode.value,
                        label: 'Password',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
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
                      Obx(() => TextButton(
                        onPressed: (){
                          context.goNamed(NamedRoutes.navbarpage.name);


                        },
                        // onPressed: loginViewModel.loading.value
                        //     ? null  // Disable button while logging in
                        //     : () {
                        //   if (formKey.currentState!.validate()) {
                        //     loginViewModel.loginUser(context);
                        //   }
                        // },
                        child: Text(
                          loginViewModel.loading.value ? 'Signing in...' : 'Sign In',
                          style: TextStyle(color: whiteColor), // Optional: customize text color
                        ),
                      )),
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
                      SizedBox(height: screenHeight * 0.06),

                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: customGreyColor,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
                                color: lightGreenColor,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'OpenSans',
                              ),

                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  GoRouter.of(context).pushNamed((NamedRoutes.signuppage.name));
                                },
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
        );
  }
}
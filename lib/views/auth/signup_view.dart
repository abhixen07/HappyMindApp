import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:happymindapp/viewmodel/signup_view_model.dart';
import '../../app/customwidget/custom_text_field.dart';
import '../../app/routes/app_routes.dart';
import '../../app/style/style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final signUpViewModel = Get.put(SignUpViewModel());
  final formKey = GlobalKey<FormState>();
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
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/svg/app_logo_svg.svg',height: screenHeight*0.08),
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
                        controller: signUpViewModel.fullNameController.value,
                        currentFocusNode: signUpViewModel.fullNameFocusNode.value,
                        nextFocusNode: signUpViewModel.emailFocusNode.value,
                        hintText: 'Enter You Name',
                        label: 'Full Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter First Name';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      /// Email Address Field
                      CustomTextFormField(
                        controller: signUpViewModel.emailController.value,
                        currentFocusNode: signUpViewModel.emailFocusNode.value,
                        nextFocusNode: signUpViewModel.passwordFocusNode.value,
                        hintText: 'Enter email address',
                        label: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Email';
                          }
                          if (!EmailValidator.validate(signUpViewModel.emailController.value.text)) {
                            return 'Please Enter valid Email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      /// Password Field
                      CustomTextFormField(
                        controller: signUpViewModel.passwordController.value,
                        hintText: 'Enter password',
                        currentFocusNode: signUpViewModel.passwordFocusNode.value,
                        nextFocusNode: signUpViewModel.phoneFocusNode.value,
                        label: 'Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }
                          if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$!%?&\-])[a-zA-Z\d@#$!%?&\-]{8,}$')
                              .hasMatch(signUpViewModel.passwordController.value.text)) {
                            return 'Password must include at least one\nuppercase letter, one lowercase\nletter, one digit, one special character,\nand be at least 8 characters long';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      /// Mobile Number Field
                      CustomTextFormField(
                        controller: signUpViewModel.phonenumberController.value,
                        hintText: 'Enter Your Mobile Number',
                        currentFocusNode: signUpViewModel.phoneFocusNode.value,
                        label: 'Mobile Number',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Phone Number';
                            }
                            if (!RegExp(r'^03\d{9}$').hasMatch(value)) {
                              return 'Phone number must start with\n03 and be 11 digits long';
                            }
                            return null;
                          }


                      ),

                      SizedBox(height: screenHeight * 0.05),

                      /// Create Account
                      Obx(() => TextButton(
                        onPressed: signUpViewModel.loading.value
                            ? null // Disable button while signing up
                            : () {
                          if (formKey.currentState!.validate()) {
                            signUpViewModel.signUpUser(context);
                          }
                        },
                        child: Text(
                          signUpViewModel.loading.value ? 'Signing up...' : 'Sign Up',
                          style: TextStyle(color: whiteColor), // optional style
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
                ),
              ],
            ),
        );
  }
}
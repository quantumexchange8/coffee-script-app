import 'package:coffee_script_app/controller/controller.dart';
import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/auth/register_page.dart';
import 'package:coffee_script_app/pages/auth/widgets.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: backgroundDecoration,
          child: Column(
            children: [
              SizedBox(
                height: height10 * 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      logoCoffeeScript,
                      SizedBox(
                        height: height08 * 2,
                      ),
                      titleAuthPage('Welcome to Login'),
                      SizedBox(
                        height: height31,
                      ),
                      darkTextfield(
                          controller: emailController,
                          hintText: 'E-mail Address'),
                      SizedBox(
                        height: height10,
                      ),
                      darkTextfield(
                          controller: passwordController, hintText: 'Password'),
                      SizedBox(
                        height: height05,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: customTextButton(
                            onPressedButton: () {},
                            buttonText: 'Forgot Password?',
                            fontSize: height24 / 2),
                      ),
                      SizedBox(
                        height: height08 * 2,
                      ),
                      filledButton(
                          onPressed: () async {
                            await productController
                                .getProductList()
                                .then((success) {
                              if (success) {
                                Navigator.pushReplacementNamed(
                                    context, 'homeRoute');
                              }
                            });
                          },
                          text: 'Sign In')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height31,
              ),
              orDivider('Or Login with'),
              SizedBox(
                height: height24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  thirdPartyLogo('assets/logo/facebook_logo.png',
                      cacheHeight: (height10 * 4).toInt()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width20),
                    child: thirdPartyLogo('assets/logo/google_logo.png'),
                  ),
                  thirdPartyLogo('assets/logo/twitter_logo.png'),
                ],
              ),
              const Expanded(flex: 2, child: SizedBox()),
              changeAuthPageText(
                  firstText: 'Don\'t have an account?',
                  onPressedButton: () {
                    pushReplacement(context, nextPage: const RegisterPage());
                  },
                  buttonText: 'Register'),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

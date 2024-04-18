import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/auth/login_page.dart';
import 'package:coffee_script_app/pages/auth/widgets.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController comfirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> textfieldElement = [
      {'controller': fullNameController, 'hint_text': 'Full Name'},
      {'controller': emailController, 'hint_text': 'E-mail Address'},
      {'controller': passwordController, 'hint_text': 'Password'},
      {
        'controller': comfirmPasswordController,
        'hint_text': 'Comfirm Password'
      },
    ];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          decoration: backgroundDecoration,
          child: Column(
            children: [
              SizedBox(
                height: height10 * 8,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  logoCoffeeScript,
                  SizedBox(
                    height: height08 * 2,
                  ),
                  titleAuthPage('Register your Account'),
                  SizedBox(
                    height: height31,
                  ),
                  ...textfieldElement
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  e == textfieldElement.last ? 0 : height10),
                          child: darkTextfield(
                              controller: e['controller'],
                              hintText: e['hint_text']),
                        ),
                      )
                      .toList(),
                  SizedBox(
                    height: height08 * 2,
                  ),
                  filledButton(onPressed: () {}, text: 'Register')
                ],
              ),
              SizedBox(
                height: height31,
              ),
              orDivider('Or Register with'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height24),
                child: Row(
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
              ),
              changeAuthPageText(
                  firstText: 'Don\'t have an account?',
                  onPressedButton: () {
                    pushReplacement(
                      context,
                      nextPage: const LoginPage(),
                      begin: const Offset(-1, 0),
                    );
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

import 'dart:convert';

import 'package:coffee_script_app/models/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:http/http.dart' as http;

const twitterApiKey = 'LWX9itQNkaQdHNPndFbd70ch6';
const twitterSecretKey = 'XafzCwhLfnWyBueNlo9b7MBikacxTNptnxoNo5HXIQhc1lMNP9';

class UserController extends GetxController {
  static UserController instance = Get.find();
  Rxn<UserInfo> profile = Rxn<UserInfo>();
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final twitterLogin = TwitterLogin(
      apiKey: twitterApiKey,
      apiSecretKey: twitterSecretKey,
      redirectURI: "coffeescript://");

  Future<UserInfo?> logIn(String method) async {
    try {
      await EasyLoading.show(status: 'Loading');
      UserInfo? user;

      switch (method) {
        case 'fb':
          final LoginResult fbLoginResult = await facebookAuth.login();
          if (fbLoginResult.status == LoginStatus.success) {
            final graphResponse = await http.get(Uri.parse(
                'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${fbLoginResult.accessToken!.token}'));

            if (graphResponse.statusCode == 200) {
              final profile = jsonDecode(graphResponse.body);
              user = UserInfo(
                  id: profile['id'],
                  name: profile['name'],
                  image: profile['picture']['data']['url']);
            }
          }

        case 'tw':
          final twResult = await twitterLogin.loginV2();
          if (twResult.status == TwitterLoginStatus.loggedIn) {
            final userDetails = twResult.user;
            if (userDetails != null) {
              user = UserInfo(
                  id: userDetails.id.toString(),
                  name: userDetails.name,
                  image: userDetails.thumbnailImage);
            }
          }

        case 'gl':
          final GoogleSignInAccount? googleSignInAccount =
              await googleSignIn.signIn();
          if (googleSignInAccount != null) {
            user = UserInfo(
                id: googleSignInAccount.id,
                name: googleSignInAccount.displayName ?? 'Not Found',
                image: googleSignInAccount.photoUrl);
          }

          break;
        default:
          return UserInfo(
              id: '1',
              name: 'Shahzaib',
              image:
                  'https://plus.unsplash.com/premium_photo-1683121366070-5ceb7e007a97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D');
      }
      profile.value = user;
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    } finally {
      EasyLoading.dismiss();
    }
  }
}

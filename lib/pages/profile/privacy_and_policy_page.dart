import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/widgets/outside_appbar.dart';
import 'package:flutter/material.dart';

class PrivacyAndPolicyPage extends StatelessWidget {
  const PrivacyAndPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: outsideAppBar(context, title: 'Privacy & Policy'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height24),
        children: [
          Text(
            _privacyAndPolicySample['title'],
            style: subtitleStyle.copyWith(
                fontSize: subtitleSmall, color: Colors.black),
          ),
          SizedBox(
            height: height24,
          ),
          Text(
            _privacyAndPolicySample['body'],
            style: descriptionStyle.copyWith(
                color: const Color(0xFF000000).withOpacity(0.55)),
          )
        ],
      ),
    );
  }
}

const Map<String, dynamic> _privacyAndPolicySample = {
  'title': 'Terms & Conditions ',
  'body':
      'Lorem ipsum dolor sit amet consectetur. Consequat tempus velit tempor eros. Orci egestas pharetra at pharetra lobortis at. Morbi sagittis dui orci quis arcu massa pellentesque libero euismod. Erat laoreet sit mi dictumst ultrices amet. Elementum in commodo scelerisque non in.\nPulvinar tortor ac aliquam tortor enim. Volutpat aliquam ut purus nibh quisque amet ut morbi. Sed eget auctor quis nibh mattis feugiat tincidunt ridiculus accumsan. Nisl fermentum nulla mattis elementum condimentum leo massa. Potenti leo feugiat orci at scelerisque lacus nibh. Egestas cras sem vestibulum maecenas massa pulvinar rhoncus pharetra arcu. Turpis quam non praesent dictum et arcu ultrices sed.\nPulvinar tortor ac aliquam tortor enim. Volutpat aliquam ut purus nibh quisque amet ut morbi. Sed eget auctor quis nibh mattis feugiat tincidunt ridiculus accumsan. Nisl fermentum nulla mattis elementum condimentum leo massa. Potenti leo feugiat orci at scelerisque lacus nibh. Egestas cras sem vestibulum maecenas massa pulvinar rhoncus pharetra arcu. Turpis quam non praesent dictum et arcu ultrices sed.'
};

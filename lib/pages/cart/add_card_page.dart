import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/cart/add_card_widgets/card_container.dart';
import 'package:coffee_script_app/pages/cart/add_card_widgets/card_details_textfields.dart';
import 'package:coffee_script_app/pages/cart/add_card_widgets/save_card_tickbox.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardExpiryController = TextEditingController();
  final TextEditingController cVVController = TextEditingController();
  bool saveCard = false;

  @override
  Widget build(BuildContext context) {
    const cardNumberHint = '8763 2736 9873 03290';
    const cardHolderNameHint = 'Name Here';
    const cardExpiryHint = '28/22';

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: simpleAppBar(context, title: 'Add card'),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding:
              EdgeInsets.symmetric(horizontal: width20, vertical: height24),
          children: [
            cardContainer(
                cardNumber: cardNumberController.text.isEmpty
                    ? cardNumberHint
                    : cardNumberController.text,
                cardHolderName: cardHolderNameController.text.isEmpty
                    ? cardHolderNameHint
                    : cardHolderNameController.text,
                expiredDate: cardExpiryController.text.isEmpty
                    ? cardExpiryHint
                    : cardExpiryController.text),
            SizedBox(
              height: height31,
            ),
            cardDetailsTextfieldColumn(
                controller: cardHolderNameController,
                textLabel: 'Card Holder name',
                hintText: cardHolderNameHint),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height08 * 2),
              child: cardDetailsTextfieldColumn(
                  controller: cardNumberController,
                  textLabel: 'Card Number',
                  hintText: cardNumberHint),
            ),
            Row(
              children: [
                Expanded(
                  child: cardDetailsTextfieldColumn(
                      controller: cardExpiryController,
                      textLabel: 'Expiry',
                      hintText: cardExpiryHint),
                ),
                SizedBox(
                  width: width08,
                ),
                Expanded(
                  child: cardDetailsTextfieldColumn(
                      controller: cVVController,
                      textLabel: 'CVV',
                      hintText: '000'),
                ),
              ],
            ),
            SizedBox(
              height: height08 * 2,
            ),
            saveCardRow(
              checkboxValue: saveCard,
              onChangedCheckbox: (value) {
                setState(() {
                  if (value != null) {
                    saveCard = value;
                  }
                });
              },
            ),
            SizedBox(
              height: height45,
            ),
            filledButton(
                onPressed: () {},
                height: height10 * 5.9,
                textStyle: textButtonStyle.copyWith(fontSize: height10 * 1.8),
                text: 'ADD CARD')
          ],
        ),
      ),
    );
  }
}

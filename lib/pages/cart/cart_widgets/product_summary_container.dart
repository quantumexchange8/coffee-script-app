import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

Row enterCouponCodeContainer({
  TextEditingController? couponController,
  void Function()? onTapApply,
}) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width24 / 2,
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              border: Border(
                left: BorderSide(color: descriptionColor),
                top: BorderSide(color: descriptionColor),
                bottom: BorderSide(color: descriptionColor),
              )),
          child: TextField(
            controller: couponController,
            decoration: InputDecoration(
                hintText: 'Enter Coupon Code here',
                hintStyle: hintStyle.copyWith(
                    fontFamily: 'Inter',
                    fontSize: height10,
                    color: backgroundColor,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: onTapApply,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: backgroundColor),
            child: Center(
                child:
                    Text('Apply', style: hintStyle.copyWith(color: textColor))),
          ),
        ),
      ),
    ],
  );
}

Row cartDetailsRow({
  required String key,
  required String value,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        key,
        style:
            hintStyle.copyWith(color: descriptionColor, fontSize: height24 / 2),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width08),
          child: DottedLine(
            dashColor: const Color(0xFF000000).withOpacity(0.4),
            dashLength: 1,
            dashGapLength: 1,
          ),
        ),
      ),
      Text(
        value,
        style: subtitleStyle.copyWith(
            fontSize: height10 * 1.3, color: descriptionColor),
      ),
    ],
  );
}

Container productSummaryContainer({
  required double subTotal,
  required double shippingCost,
  required double total,
}) {
  return Container(
    width: width100 * 3.5,
    padding: EdgeInsets.symmetric(
      horizontal: width16,
      vertical: height24 / 2,
    ),
    decoration: BoxDecoration(
        color: primaryColor, borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        enterCouponCodeContainer(),
        SizedBox(
          height: height30,
        ),
        cartDetailsRow(key: 'Sub-total', value: '\$${subTotal.toInt()}'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height24 / 2),
          child: cartDetailsRow(
              key: 'Shipping', value: '\$${shippingCost.toInt()}'),
        ),
        cartDetailsRow(key: 'Total', value: '\$${total.toInt()}'),
      ],
    ),
  );
}

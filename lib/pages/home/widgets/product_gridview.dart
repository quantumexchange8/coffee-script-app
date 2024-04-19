import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/home/widgets/product_container.dart';
import 'package:flutter/material.dart';

GridView productGridview(List<Map<String, dynamic>> productList) {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount: productList.length,
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: height24 / 2,
        mainAxisSpacing: width24 / 2,
        childAspectRatio: 0.9),
    itemBuilder: (context, index) {
      final product = productList[index];

      return productContainer(
          productImage: product['product_image'],
          productName: product['product_name'],
          productPrice: product['product_price'],
          productDescription: product['product_description'],
          isFavourite: changeBoolString(product['favourite']));
    },
  );
}

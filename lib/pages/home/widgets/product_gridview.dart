import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/product.dart';
import 'package:coffee_script_app/pages/home/widgets/product_container.dart';
import 'package:coffee_script_app/pages/universal/select_product_page.dart';
import 'package:flutter/material.dart';

GridView productGridview(List<Product> productList) {
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

      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SelectProductPage(selectedProduct: product),
              ));
        },
        child: productContainer(
            productImage: product.productImage,
            productName: product.productName,
            productPrice: product.toString(),
            productDescription: product.productDescription,
            isFavourite: product.favourite),
      );
    },
  );
}

import 'package:coffee_script_app/controller/controller.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/cart_item.dart';
import 'package:coffee_script_app/models/product.dart';
import 'package:coffee_script_app/pages/universal/select_product_methods.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets/add_to_cart_row.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets/ingredients_column.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets/product_count_row.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets/product_size_column.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets/select_product_background_image.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets/semi_spherical_container.dart';
import 'package:coffee_script_app/pages/widgets/like_button.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';

class SelectProductPage extends StatefulWidget {
  final Product selectedProduct;
  const SelectProductPage({super.key, required this.selectedProduct});

  @override
  State<SelectProductPage> createState() => _SelectProductPageState();
}

class _SelectProductPageState extends State<SelectProductPage> {
  int selectedCoffeeSizeIndex = 1;
  int productCount = 1;

  @override
  Widget build(BuildContext context) {
    Product selectedProduct = widget.selectedProduct;
    double totalAmount = selectedProduct.productPrice * productCount;
    if (selectedCoffeeSizeIndex == 0) {
      totalAmount -= 2;
    } else if (selectedCoffeeSizeIndex == 2) {
      totalAmount += 2;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: simpleAppBar(
        context,
        title:
            '${selectedProduct.productName} ${determineCoreProduct(selectedProduct.productType)}',
        actions: [
          likeButton(
            isFavourite: selectedProduct.favourite,
            height: height24,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: selectProductBackgroundImage,
              ),
              const Expanded(flex: 3, child: SizedBox())
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: semiSphericalContainer(
                Column(
                  children: [
                    SizedBox(
                      height: height31,
                    ),
                    ingredientsColumn(),
                    SizedBox(
                      height: height31,
                    ),
                    productSizeColumn(
                        onTapProductSize: (index) {
                          setState(() {
                            selectedCoffeeSizeIndex = index;
                          });
                        },
                        selectedProductType: selectedProduct.productType,
                        selectedCoffeeSizeIndex: selectedCoffeeSizeIndex),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height31),
                      child: productCountRow(
                          onTapMinus: () {
                            setState(() {
                              if (productCount > 1) {
                                productCount--;
                              }
                            });
                          },
                          onTapAdd: () {
                            setState(() {
                              productCount++;
                            });
                          },
                          countProduct: productCount),
                    ),
                    addToCartRow(
                      totalAmount: totalAmount,
                      onPressedAddToCart: () {
                        cartController.cartProductList.add(CartItem(
                            product: selectedProduct,
                            productCount: productCount));
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

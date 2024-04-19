import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets.dart/ingredients_column.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets.dart/product_count_row.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets.dart/product_size_column.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets.dart/select_product_background_image.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets.dart/semi_spherical_container.dart';
import 'package:coffee_script_app/pages/widgets/like_button.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';

class SelectProductPage extends StatefulWidget {
  final Map<String, dynamic> selectedProduct;
  const SelectProductPage({super.key, required this.selectedProduct});

  @override
  State<SelectProductPage> createState() => _SelectProductPageState();
}

class _SelectProductPageState extends State<SelectProductPage> {
  int selectedCoffeeSizeIndex = 1;
  int productCount = 1;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> selectedProduct = widget.selectedProduct;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: simpleAppBar(
        context,
        title: selectedProduct['product_name'],
        actions: [
          likeButton(
            isFavourite: changeBoolString(selectedProduct['favourite']),
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
                    productSizeColumn(
                        onTapProductSize: () {
                          setState(() {});
                        },
                        selectedProductType: selectedProduct['product_type'],
                        selectedCoffeeSizeIndex: selectedCoffeeSizeIndex),
                    productCountRow(
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
                        countProduct: productCount)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

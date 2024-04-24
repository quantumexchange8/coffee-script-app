import 'package:coffee_script_app/models/cart_item.dart';
import 'package:coffee_script_app/models/product.dart';

final sampleCartItems1 = [
  CartItem(
      product: Product(
        productId: 1,
        productImage: 'assets/product/robusta.png',
        productName: 'Robusta',
        productIngredient: 'Milk',
        productPrice: 20,
        productType: 'coffee',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 2),
  CartItem(
      product: Product(
        productId: 2,
        productImage: 'assets/product/liberica.png',
        productName: 'Liberica',
        productIngredient: 'Water',
        productPrice: 12,
        productType: 'hot teas',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 1),
  CartItem(
      product: Product(
        productId: 3,
        productImage: 'assets/product/cirtus.png',
        productName: 'Cirtus',
        productIngredient: 'Lemon',
        productPrice: 12,
        productType: 'hot teas',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 1),
];

final sampleCartItems2 = [
  CartItem(
      product: Product(
        productId: 2,
        productImage: 'assets/product/liberica.png',
        productName: 'Liberica',
        productIngredient: 'Water',
        productPrice: 12,
        productType: 'hot teas',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 2),
  CartItem(
      product: Product(
        productId: 1,
        productImage: 'assets/product/robusta.png',
        productName: 'Robusta',
        productIngredient: 'Milk',
        productPrice: 20,
        productType: 'coffee',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 1),
  CartItem(
      product: Product(
        productId: 3,
        productImage: 'assets/product/cirtus.png',
        productName: 'Cirtus',
        productIngredient: 'Lemon',
        productPrice: 12,
        productType: 'hot teas',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 1),
];

final sampleCartItems3 = [
  CartItem(
      product: Product(
        productId: 3,
        productImage: 'assets/product/cirtus.png',
        productName: 'Cirtus',
        productIngredient: 'Lemon',
        productPrice: 12,
        productType: 'hot teas',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 2),
  CartItem(
      product: Product(
        productId: 1,
        productImage: 'assets/product/robusta.png',
        productName: 'Robusta',
        productIngredient: 'Milk',
        productPrice: 20,
        productType: 'coffee',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 1),
  CartItem(
      product: Product(
        productId: 2,
        productImage: 'assets/product/liberica.png',
        productName: 'Liberica',
        productIngredient: 'Water',
        productPrice: 12,
        productType: 'hot teas',
        productDescription: 'productDescription',
        favourite: true,
      ),
      productCount: 1),
];

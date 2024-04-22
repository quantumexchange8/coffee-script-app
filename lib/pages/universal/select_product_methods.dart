String determineCoreProduct(String selectedProductType) {
  if (selectedProductType.toLowerCase().contains('coffee')) {
    return 'Coffee';
  } else if (selectedProductType.toLowerCase().contains('tea')) {
    return 'Tea';
  } else {
    return 'Drink';
  }
}

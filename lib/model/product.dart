class ProductModel {
  late String address;
  late String category;
  late String contactNumber;
  late String id;
  late String imageURL;
  late String productDescription;
  late String productPrice;
  late String productName;
  late String seller;
  late String sellerEmail;

  ProductModel(
      {required this.address,
      required this.category,
      required this.contactNumber,
      required this.id,
      required this.imageURL,
      required this.productDescription,
      required this.productPrice,
      required this.productName,
      required this.seller,
      required this.sellerEmail});
}

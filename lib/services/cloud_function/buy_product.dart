import 'package:cloud_firestore/cloud_firestore.dart';

Future buyProduct(
  String name,
  String buyerEmail,
  String buyerAddress,
  String buyerContactNumber,
  String seller,
  String sellerEmail,
  String contactNumber,
  String address,
  String category,
  String productName,
  String productDescription,
  String imageURL,
  String productPrice,
) async {
  final docUser = FirebaseFirestore.instance.collection('Purchases').doc();

  final json = {
    'name': name,
    'buyerEmail': buyerEmail,
    'seller': seller,
    'sellerEmail': sellerEmail,
    'contactNumber': contactNumber,
    'address': address,
    'category': category,
    "productName": productName,
    'productDescription': productDescription,
    'productPrice': productPrice,
    'imageURL': imageURL,
    'id': docUser.id,
    'status': 'To Deliver',
  };

  await docUser.set(json);
}

import 'package:cloud_firestore/cloud_firestore.dart';

Future addProduct(
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
  final docUser = FirebaseFirestore.instance.collection('Products').doc();

  var dt = DateTime.now();

  final json = {
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
    'date': dt.month,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}

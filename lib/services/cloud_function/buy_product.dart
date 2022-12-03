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
    int qty) async {
  final docUser = FirebaseFirestore.instance.collection('Purchases').doc();

  var dt = DateTime.now();

  final json = {
    'name': name,
    'buyerEmail': buyerEmail,
    'buyerAddress': buyerAddress,
    'buyerContactNumber': buyerContactNumber,
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
    'qty': qty,
    'date': dt.month,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}

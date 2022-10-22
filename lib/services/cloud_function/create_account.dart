import 'package:cloud_firestore/cloud_firestore.dart';

Future createAccount(
  String name,
  String email,
  String profilePicture,
  String phoneNumber,
  String address,
) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc();

  final json = {
    'phoneNumber': phoneNumber,
    'address': address,
    'profilePicture': profilePicture,
    'email': email,
    'name': name,
    'id': docUser.id,
  };

  await docUser.set(json);
}

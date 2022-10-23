import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketdo/screens/home_page.dart';
import 'package:marketdo/services/cloud_function/add_product.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_widget.dart';

class PostProduct extends StatefulWidget {
  @override
  State<PostProduct> createState() => _PostProductState();
}

class _PostProductState extends State<PostProduct> {
  var hasLoaded = false;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  Future<void> uploadPicture(String inputSource) async {
    final picker = ImagePicker();
    XFile pickedImage;
    try {
      pickedImage = (await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920))!;

      fileName = path.basename(pickedImage.path);
      imageFile = File(pickedImage.path);

      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AlertDialog(
                title: Row(
              children: const [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Loading . . .',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'QRegular'),
                ),
              ],
            )),
          ),
        );

        await firebase_storage.FirebaseStorage.instance
            .ref('Products/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('Products/$fileName')
            .getDownloadURL();

        setState(() {
          hasLoaded = true;
        });

        Navigator.of(context).pop();
      } on firebase_storage.FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  int _value = 0;

  late String category = 'Snacks';

  late String productName = '';

  late String productDescription = '';

  late String name = '';

  late String address = '';

  late String contactNumber = '';

  late String productPrice = '';

  late String email = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  final box = GetStorage();

  getData() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: box.read('email'));

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();

          name = data['name'];
          contactNumber = data['phoneNumber'];
          address = data['address'];
          email = data['email'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                uploadPicture('gallery');
              },
              child: hasLoaded
                  ? SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(
                        imageURL,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 150,
                      width: 150,
                      child: Center(
                        child: TextBold(
                            text: 'Add Photo',
                            fontSize: 18,
                            color: Colors.lightGreen),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightGreen),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextBold(
              text: 'Product Name',
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Enter Product Name'),
              onChanged: (_input) {
                productName = _input;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextBold(
              text: 'Product Description',
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              maxLines: 3,
              decoration:
                  const InputDecoration(hintText: 'Enter Product Description'),
              onChanged: (_input) {
                productDescription = _input;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: TextBold(
              text: 'Product Price',
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  suffix: TextRegular(
                    text: '.00php',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter Product Price'),
              onChanged: (_input) {
                productPrice = _input;
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: TextBold(
                text: 'Product Category',
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: 200,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton(
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.teal,
                  isExpanded: true,
                  iconEnabledColor: Colors.white,
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      onTap: () {
                        category = 'Snacks';
                      },
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextBold(
                            text: 'Snacks', color: Colors.black, fontSize: 18),
                      )),
                      value: 0,
                    ),
                    DropdownMenuItem(
                      onTap: () {
                        category = 'Meals';
                      },
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextBold(
                            text: 'Meals', color: Colors.black, fontSize: 18),
                      )),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      onTap: () {
                        category = 'Vegetables';
                      },
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextBold(
                            text: 'Vegetables',
                            color: Colors.black,
                            fontSize: 18),
                      )),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      onTap: () {
                        category = 'Fruits';
                      },
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextBold(
                            text: 'Fruits', color: Colors.black, fontSize: 18),
                      )),
                      value: 3,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = int.parse(value.toString());
                    });
                  },
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Divider(),
          ),
          ListTile(
            leading: TextRegular(
              text: 'Mode of Payment',
              fontSize: 12,
              color: Colors.grey,
            ),
            trailing: TextBold(
              text: 'Cash on Delivery',
              fontSize: 18,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ButtonWidget(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text(
                              'Success!',
                              style: TextStyle(
                                  fontFamily: 'QBold',
                                  fontWeight: FontWeight.bold),
                            ),
                            content: const Text(
                              'Product Posted Successfully!',
                              style: TextStyle(fontFamily: 'QRegular'),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  addProduct(
                                      name,
                                      email,
                                      contactNumber,
                                      address,
                                      category,
                                      productName,
                                      productDescription,
                                      imageURL,
                                      productPrice);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontFamily: 'QRegular',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ));
                },
                text: 'Post Product'),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:marketdo/screens/home_page.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/text_widget.dart';

class PostProduct extends StatefulWidget {
  @override
  State<PostProduct> createState() => _PostProductState();
}

class _PostProductState extends State<PostProduct> {
  int _value = 0;

  late String category = 'Snacks';

  late String productName = '';

  late String productDescription = '';

  late String name = '';

  late String address = '';

  late String contactNumber = '';

  late String productPrice = '';

  late String imageURL = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 150,
              width: 150,
              child: Center(
                child: TextBold(
                    text: 'Add Photo', fontSize: 18, color: Colors.lightGreen),
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
                                print(category);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              },
                              child: const Text(
                                'Close',
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
    ));
  }
}

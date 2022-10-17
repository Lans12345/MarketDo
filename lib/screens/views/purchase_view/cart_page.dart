import 'package:flutter/material.dart';
import 'package:marketdo/widgets/text_widget.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              TextRegular(text: 'My Cart', fontSize: 18, color: Colors.white),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          foregroundColor: Colors.white),
      body: Stack(
        children: [
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: ((context, index) {
                      return CheckboxListTile(
                        activeColor: Colors.lightGreen,
                        subtitle: TextRegular(
                            text: 'Olana Shop',
                            fontSize: 12,
                            color: Colors.grey),
                        title: TextBold(
                            text: 'Fresh Saging - 250.00php',
                            fontSize: 18,
                            color: Colors.black),
                        secondary: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/googlelogo.png',
                            height: 25,
                            width: 25,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (newValue) {
                          setState(() {
                            isSelected = newValue!;
                          });
                        },
                        value: isSelected,
                      );
                    }));
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.lightGreen,
              width: double.infinity,
              height: 70,
              child: ListTile(
                leading:
                    TextBold(text: 'Total', fontSize: 16, color: Colors.white),
                title: TextBold(
                    text: '250.00php', fontSize: 24, color: Colors.white),
                trailing: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  color: Colors.white,
                  child: TextRegular(
                      text: 'Continue', fontSize: 14, color: Colors.lightGreen),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

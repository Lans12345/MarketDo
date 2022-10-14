import 'package:flutter/material.dart';
import 'package:marketdo/screens/view_product_page.dart';
import 'package:marketdo/widgets/text_widget.dart';
import 'package:get_storage/get_storage.dart';

class ProductCategory extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[400],
        title: TextBold(
            text: box.read('categ'), fontSize: 18, color: Colors.white),
      ),
      body: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ViewProductPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.lightBlue[200],
                            height: 120,
                            width: 170,
                            child: Image.asset(
                              'assets/images/googlelogo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 50,
                            width: 170,
                            child: ListTile(
                              trailing: TextBold(
                                  text: '250php',
                                  fontSize: 18,
                                  color: Colors.blue),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBold(
                                      text: 'Saging',
                                      fontSize: 14,
                                      color: Colors.black),
                                  TextRegular(
                                      text: 'Impasugong Bukidnon',
                                      fontSize: 10,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}

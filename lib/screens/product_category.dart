import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Products')
              .where('category', isEqualTo: box.read('categ'))
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(child: Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('waiting');
              return const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              );
            }

            final data = snapshot.requireData;
            return GridView.builder(
                itemCount: snapshot.data?.size ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      box.write('address', data.docs[index]['address']);
                      box.write('category', data.docs[index]['category']);
                      box.write(
                          'contactNumber', data.docs[index]['contactNumber']);
                      box.write('id', data.docs[index]['id']);
                      box.write('imageURL', data.docs[index]['imageURL']);
                      box.write('productDescription',
                          data.docs[index]['productDescription']);

                      box.write(
                          'productPrice', data.docs[index]['productPrice']);
                      box.write('productName', data.docs[index]['productName']);
                      box.write('seller', data.docs[index]['seller']);
                      box.write('sellerEmail', data.docs[index]['sellerEmail']);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewProductPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.lightBlue[200],
                            height: 120,
                            width: 170,
                            child: Image.network(
                              data.docs[index]['imageURL'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: 50,
                            width: 170,
                            child: ListTile(
                              trailing: TextBold(
                                  text: data.docs[index]['productPrice'],
                                  fontSize: 18,
                                  color: Colors.blue),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBold(
                                      text: data.docs[index]['productName'],
                                      fontSize: 14,
                                      color: Colors.black),
                                  TextRegular(
                                      text: data.docs[index]['address'],
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

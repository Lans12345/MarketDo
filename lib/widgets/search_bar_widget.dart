import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/screens/view_product_page.dart';
import 'package:marketdo/widgets/text_widget.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions

    late String result = '';

    return [
      IconButton(
        onPressed: () {
          if (query != '') {
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                content: Text('No Input. Cannot Procceed'),
              ),
            );
          }
        },
        icon: const Icon(
          Icons.search,
          color: Colors.blue,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final box = GetStorage();
    // TODO: implement buildSuggestions
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Products')
            .where('productName', isEqualTo: query)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          return SizedBox(
              child: ListView.builder(
                  itemCount: snapshot.data?.size ?? 0,
                  itemBuilder: ((context, index) {
                    return ListTile(
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
                        box.write(
                            'productName', data.docs[index]['productName']);
                        box.write('seller', data.docs[index]['seller']);
                        box.write(
                            'sellerEmail', data.docs[index]['sellerEmail']);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewProductPage()));
                      },
                      leading: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.network(data.docs[index]['imageURL']),
                      ),
                      title: TextBold(
                          text: data.docs[index]['productName'],
                          fontSize: 18,
                          color: Colors.black),
                      subtitle: TextRegular(
                          text: data.docs[index]['address'],
                          fontSize: 12,
                          color: Colors.grey),
                    );
                  })));
        });
  }
}

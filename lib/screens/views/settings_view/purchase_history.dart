import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/widgets/appbar_widget.dart';
import 'package:marketdo/widgets/text_widget.dart';

class PurchaseHistory extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('Purchase History'),
      body: SizedBox(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Purchases')
                .where('buyerEmail', isEqualTo: box.read('email'))
                .where('status', isEqualTo: 'History')
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
              return SizedBox(
                  child: ListView.separated(
                      separatorBuilder: ((context, index) {
                        return const Divider();
                      }),
                      itemCount: snapshot.data?.size ?? 0,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.network(data.docs[index]['imageURL']),
                          ),
                          title: TextBold(
                              text: data.docs[index]['productName'],
                              fontSize: 18,
                              color: Colors.black),
                          subtitle: TextRegular(
                              text: 'Seller: ${data.docs[index]['seller']}',
                              fontSize: 12,
                              color: Colors.grey),
                          trailing: TextBold(
                            text: '${data.docs[index]['productPrice']}.00php',
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        );
                      })));
            }),
      ),
    );
  }
}

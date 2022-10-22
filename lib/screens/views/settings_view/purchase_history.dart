import 'package:flutter/material.dart';
import 'package:marketdo/widgets/appbar_widget.dart';
import 'package:marketdo/widgets/text_widget.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('Purchase History'),
      body: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset('assets/images/googlelogo.png'),
                    ),
                    title: TextBold(
                        text: 'Fresh Saging',
                        fontSize: 18,
                        color: Colors.black),
                    subtitle: TextRegular(
                        text: 'Purchase on 10/10/2022',
                        fontSize: 12,
                        color: Colors.grey),
                    trailing: TextBold(
                      text: '450.00php',
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  );
                });
          }),
    );
  }
}

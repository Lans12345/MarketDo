import 'package:flutter/material.dart';
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
    // TODO: implement buildSuggestions
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return ListView.separated(
              itemCount: 20,
              separatorBuilder: ((context, index) {
                return const Divider();
              }),
              itemBuilder: ((context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewProductPage()));
                  },
                  leading: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('assets/images/googlelogo.png'),
                  ),
                  title: TextBold(
                      text: 'Fresh Saging', fontSize: 18, color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Impasugong Bukidnon',
                      fontSize: 12,
                      color: Colors.grey),
                );
              }));
        });
  }
}

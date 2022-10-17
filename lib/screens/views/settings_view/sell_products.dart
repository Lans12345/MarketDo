import 'package:flutter/material.dart';
import 'package:marketdo/widgets/appbar_widget.dart';
import 'package:marketdo/widgets/button_widget.dart';
import 'package:marketdo/widgets/text_widget.dart';

class SellProducts extends StatefulWidget {
  const SellProducts({Key? key}) : super(key: key);

  @override
  State<SellProducts> createState() => _SellProductsState();
}

class _SellProductsState extends State<SellProducts> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('My Products'),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/googlelogo.png'),
                ),
                title: TextBold(
                  text: 'Fresh Saging',
                  fontSize: 18,
                  color: Colors.grey,
                ),
                subtitle: TextRegular(
                  text: 'Posted on 10/10/2022',
                  fontSize: 12,
                  color: Colors.grey,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return ColoredBox(
                            color: Colors.grey[200]!,
                            child: Column(
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
                                            text: 'Add Photo',
                                            fontSize: 18,
                                            color: Colors.lightGreen),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.lightGreen),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  child: TextBold(
                                    text: 'Product Name',
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: 'Enter Product Name'),
                                    onChanged: (_input) {},
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  child: TextBold(
                                    text: 'Product Description',
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: TextFormField(
                                    maxLines: 3,
                                    decoration: const InputDecoration(
                                        hintText: 'Enter Product Description'),
                                    onChanged: (_input) {},
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 20, 10),
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
                                        borderRadius: BorderRadius.circular(10),
                                        dropdownColor: Colors.lightGreen,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.white,
                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextBold(
                                                  text: 'All',
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            )),
                                            value: 0,
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _value =
                                                int.parse(value.toString());
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  text: 'Add Product'),
            ),
          ),
        ],
      ),
    );
  }
}

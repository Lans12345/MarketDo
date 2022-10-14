import 'package:flutter/material.dart';
import 'package:marketdo/widgets/text_widget.dart';

class HomeProfile extends StatefulWidget {
  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  bool _selected2 = false;
  bool _selected1 = true;

  late int chipValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.lightBlue[200],
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[400],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: ListTile(
                        leading: const CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        title: TextBold(
                            text: 'Lance Olana',
                            fontSize: 24,
                            color: Colors.white),
                        subtitle: TextRegular(
                            text: '09090104355',
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_rounded),
              title: TextBold(
                  text: 'My Purchase', fontSize: 15, color: Colors.black),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: ChoiceChip(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      avatar: const Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          _selected1 = value;
                          chipValue = 0;
                          _selected2 = false;
                        });
                      },
                      selectedColor: Colors.green,
                      disabledColor: Colors.grey,
                      backgroundColor: Colors.grey,
                      label: TextRegular(
                          text: 'To Pay', fontSize: 12, color: Colors.white),
                      selected: _selected1),
                ),
                const SizedBox(
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: ChoiceChip(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      avatar: const Icon(
                        Icons.payment,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          _selected2 = value;
                          chipValue = 1;
                          _selected1 = false;
                        });
                      },
                      selectedColor: Colors.green,
                      disabledColor: Colors.grey,
                      backgroundColor: Colors.grey,
                      label: TextRegular(
                          text: 'To Receive',
                          fontSize: 12,
                          color: Colors.white),
                      selected: _selected2),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                child: IndexedStack(
                  index: chipValue,
                  children: [
                    StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return SizedBox(
                            child: ListView.separated(
                              itemCount: 10,
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  title: TextBold(
                                      text: 'Fresh Saging',
                                      fontSize: 16,
                                      color: Colors.black),
                                  trailing: TextBold(
                                      text: '250PHP',
                                      fontSize: 18,
                                      color: Colors.green),
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/images/googlelogo.png'),
                                  ),
                                );
                              }),
                            ),
                          );
                        }),
                    StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return SizedBox(
                            child: ListView.separated(
                              itemCount: 10,
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  title: TextBold(
                                      text: 'Fresh Saging',
                                      fontSize: 16,
                                      color: Colors.black),
                                  trailing: TextBold(
                                      text: '230PHP',
                                      fontSize: 18,
                                      color: Colors.green),
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/images/googlelogo.png'),
                                  ),
                                );
                              }),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

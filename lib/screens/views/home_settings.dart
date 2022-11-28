import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketdo/auth/login.dart';
import 'package:marketdo/screens/views/settings_view/customer_orders_page.dart';
import 'package:marketdo/screens/views/settings_view/purchase_history.dart';
import 'package:marketdo/screens/views/settings_view/sell_products.dart';
import 'package:marketdo/widgets/text_widget.dart';

class HomeSettings extends StatelessWidget {
  const HomeSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown[400],
        title: TextBold(text: 'Settings', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SellProducts()));
            },
            title: TextBold(
                text: 'Sell Products', fontSize: 16, color: Colors.grey),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CustomerOrderPage()));
            },
            title: TextBold(
                text: 'Customer Orders', fontSize: 16, color: Colors.grey),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PurchaseHistory()));
            },
            title: TextBold(
                text: 'Purchase History', fontSize: 16, color: Colors.grey),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              showAboutDialog(
                  context: context,
                  applicationName: 'Market Do',
                  applicationIcon: Image.asset(
                    'assets/images/logoonly.png',
                    height: 20,
                  ),
                  applicationLegalese:
                      "A platform for local vendors in the community",
                  applicationVersion: 'v1.0');
            },
            title: TextBold(text: 'About us', fontSize: 16, color: Colors.grey),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Logout Confirmation',
                          style: TextStyle(
                              fontFamily: 'QBold', fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Are you sure you want to Logout?',
                          style: TextStyle(fontFamily: 'QRegular'),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          FlatButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ));
            },
            title: TextBold(text: 'Logout', fontSize: 16, color: Colors.grey),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}

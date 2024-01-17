import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:reusemart_app/provider/dark_theme_provider.dart';
import 'package:reusemart_app/widgets/text_widget.dart';
import 'package:reusemart_app/services/global_methods.dart';
import 'package:reusemart_app/screens/orders/orders_screen.dart';
import 'package:reusemart_app/screens/viewed_recently/viewed_recently.dart';
import 'package:reusemart_app/screens/wishlist/wishlist_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  text: "Hi,   ",
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                          color: color,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // ignore: avoid_print
                            print("My name is press");
                          }),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              TextWidget(
                text: "Email@gmail.com",
                color: color,
                textSize: 18,
                // isTitle :true,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 18,
              ),
              _listTiles(
                title: "Address",
                subtitle: 'My subtitle',
                icon: IconlyLight.profile,
                onPressed: () async {
                  await _showAddressDialog();
                },
                color: color,
              ),
              _listTiles(
                title: "Orders",
                icon: IconlyLight.bag,
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: OrdersScreen.routeName);
                },
                color: color,
              ),
              _listTiles(
                title: "Wishlist",
                icon: IconlyLight.heart,
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: WishlistScreen.routeName);
                },
                color: color,
              ),
              _listTiles(
                title: "Viewed",
                icon: IconlyLight.show,
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: ViewedRecentlyScreen.routeName);
                },
                color: color,
              ),
              _listTiles(
                title: "Forget Password",
                icon: IconlyLight.unlock,
                onPressed: () {},
                color: color,
              ),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                  color: color,
                  textSize: 18,
                ),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.wb_sunny_outlined),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
              _listTiles(
                title: "Logout",
                icon: IconlyLight.logout,
                onPressed: () async {
                  GlobalMethods.warningDialog(
                      title: 'Sign out',
                      subtitle: 'Do you wanna sign out?',
                      fct: () {},
                      context: context);
                },
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update"),
          content: TextField(
            // onChanged: (value){
            //  //_addressTextController.text;

            // },
            controller: _addressTextController,
            maxLines: 5,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.black,
            ),

            decoration: const InputDecoration(
              hintText: "Your address",
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Do something with the updated address
                // ignore: avoid_print
                print(_addressTextController.text);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // ignore: unused_element
  Future<void> _showLogoutDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset('assets/images/warning-sign.png',
                  height: 20, width: 20, fit: BoxFit.fill),
              const SizedBox(
                width: 8,
              ), // Add some spacing between image and text
              const Text("Sign out"),
            ],
          ),
          content: const Text(
            "Do you want to sign out",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                text: 'Cancel',
                color: Colors.cyan,
                textSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: TextWidget(
                text: 'Ok',
                color: Colors.red,
                textSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        // isTitle :true,
      ),
      subtitle: TextWidget(
        text: subtitle ?? "",
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}

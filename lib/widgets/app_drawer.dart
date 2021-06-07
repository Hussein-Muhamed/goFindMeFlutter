import 'package:flutter/material.dart';
import 'package:go_find_me/core/auth/sign_in/sign_in.dart';

Widget appDrawer() {
  return Builder(
    builder: (context) {
      return Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://static.remove.bg/remove-bg-web/2a274ebbb5879d870a69caae33d94388a88e0e35/assets/start_remove-79a4598a05a77ca999df1dcb434160994b6fde2c3e9101984fb1be0f16d0a74e.png",
                  ),
                  radius: 40,
                ),
                title: Text(
                  "UserName",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            drawerListTile(
              icon: Icons.person,
              text: "Account",
              onTap: () {},
            ),
            Divider(thickness: 2, height: 1),
            drawerListTile(
              icon: Icons.pin_drop_rounded,
              text: "Mi Tracker",
              onTap: () {},
            ),
            drawerListTile(
              icon: Icons.help,
              text: "Help & Support",
              onTap: () {},
            ),
            drawerListTile(
              icon: Icons.settings_rounded,
              text: "Setting & Privacy",
              onTap: () {},
            ),
            drawerListTile(
              icon: Icons.exit_to_app_rounded,
              text: "Sign out",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignInScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget drawerListTile({
  @required IconData icon,
  @required String text,
  onTap,
}) =>
    Builder(
      builder: (context) => ListTile(
        minLeadingWidth: 10,
        dense: true,
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onTap: onTap,
      ),
    );

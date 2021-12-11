import 'package:biofuture/utils/user_preferences.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Homepage'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Research Center'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text('Forum'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chatbox'),
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}

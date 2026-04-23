import 'package:flutter/material.dart';
import 'package:minima_notes/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.note,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25,left: 20),
            child: ListTile(
              title: Text("N O T E S"),
              leading: Icon(Icons.note),
              onTap: () => Navigator.pop(context),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25,left: 20),
            child: ListTile(
              title: Text("S E T T I N G S"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}

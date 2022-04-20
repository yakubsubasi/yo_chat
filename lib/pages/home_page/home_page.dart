import 'package:flutter/material.dart';

import '../message_page/message_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yo App'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Yakub Subaşı"),
            leading: CircleAvatar(),
            subtitle: Row(
              children: [
                Icon(Icons.star),
                Text("merhaba"),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


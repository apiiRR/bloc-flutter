import 'package:flutter/material.dart';

import '../add/add.dart';
import '../edit/edit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALL USER"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const EditPage()));
            },
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Text("Nama user"),
            subtitle: Text("Umur user"),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          );
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AddPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

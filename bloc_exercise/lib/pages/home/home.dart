import 'package:flutter/material.dart';

import '../../bloc/export.dart';
import '../../models/user.dart';
import '../add/add.dart';
import '../edit/edit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALL USER"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userB,
        builder: (context, state) {
          if (state.allUsers.isEmpty) {
            return const Center(
              child: Text("TIDAK ADA DATA"),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              User user = state.allUsers[index];
              return ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EditPage()));
                },
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(user.name),
                subtitle: Text("${user.age} tahun"),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              );
            },
            itemCount: state.allUsers.length,
          );
        },
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

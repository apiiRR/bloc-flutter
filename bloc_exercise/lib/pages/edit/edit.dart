import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/export.dart';
import '../../models/user.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key, required this.user});

  final User user;

  final TextEditingController nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();

    nameC.text = user.name;
    ageC.text = user.age.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT USER"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            decoration: const InputDecoration(
                labelText: "Name", border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: ageC,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: "Age", border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                userBloc.add(EditUserEvent(User(
                    id: user.id, name: nameC.text, age: int.parse(ageC.text))));
                Navigator.pop(context);
              },
              child: const Text("ADD USER"))
        ],
      ),
    );
  }
}

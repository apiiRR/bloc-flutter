import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Counter myCounter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTHER PAGE"),
      ),
      body: Center(
        child: BlocBuilder(
            bloc: myCounter,
            builder: (context, state) => Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                )),
      ),
    );
  }
}

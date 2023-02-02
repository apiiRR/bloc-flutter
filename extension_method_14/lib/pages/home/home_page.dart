import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc.dart';
import '../../bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String nameUser =
        context.select<UserBloc, String>((value) => value.state["name"]);
    final int ageUser =
        context.select<UserBloc, int>((value) => value.state["age"]);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Nama : $nameUser"),
            Text("Umur : $ageUser"),
            // Builder(builder: (context) {
            //   CounterBloc myCounter = context.watch<CounterBloc>();
            //   return Text(
            //     "${myCounter.state}",
            //     style: const TextStyle(fontSize: 100),
            //   );
            // }),
            // BlocBuilder<CounterBloc, int>(
            //   builder: (context, state) {
            //     return Text(
            //       "$state",
            //       style: const TextStyle(fontSize: 100),
            //     );
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      context
                          .read<UserBloc>()
                          .changeAge(context.read<UserBloc>().state["age"] - 1);
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      context
                          .read<UserBloc>()
                          .changeAge(context.read<UserBloc>().state["age"] + 1);
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}

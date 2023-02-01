import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  int? current;
  int? next;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final CounterCubit myCounter = CounterCubit(initialData: 99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CUBIT"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              initialData: myCounter.initialData,
              stream: myCounter.stream,
              builder: (context, snap) {
                // if (snap.connectionState == ConnectionState.waiting) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // } else {
                //   return Center(
                //     child: Text(
                //       "${snap.data}",
                //       style: const TextStyle(fontSize: 50),
                //     ),
                //   );
                // }
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "${snap.data}",
                        style: const TextStyle(fontSize: 50),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Current : ${myCounter.current}",
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text(
                        "Next : ${myCounter.next}",
                        style: const TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => myCounter.kurangData(),
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () => myCounter.tambahData(),
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';
import '../other/other_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Counter myCounter = BlocProvider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Depedency Injection"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Material(
                color: Colors.green,
                child: InkWell(
                  onTap: () {
                    myCounter.decrement();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.redAccent,
                child: Container(
                  color: Colors.amber,
                  margin: const EdgeInsets.all(20),
                  child: Container(
                    color: Colors.blue,
                    margin: const EdgeInsets.all(20),
                    child: Center(
                      child: BlocBuilder(
                          bloc: myCounter,
                          builder: (context, state) => Text(
                                "$state",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 50),
                              )),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Material(
                color: Colors.green,
                child: InkWell(
                  onTap: () {
                    myCounter.increment();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (_) => BlocProvider.value(
          //               value: myCounter,
          //               child: const OtherPage(),
          //             )));
          Navigator.pushNamed(context, "/other");
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

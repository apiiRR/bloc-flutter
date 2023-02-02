import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
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
                    child: const Center(
                      child: Text(
                        "0",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
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
                  onTap: () {},
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
    );
  }
}

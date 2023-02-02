import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter.dart';
import 'home/home_page.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Counter myCounter = Counter();
  final router = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: BlocProvider(
      //   create: (context) => Counter(),
      //   child: const HomePage(),
      // ),
      onGenerateRoute: router.onRoute,
    );
  }
}

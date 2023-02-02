import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter.dart';
import 'bloc/theme.dart';
import 'pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeBloc myTheme = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Counter()),
          BlocProvider(create: (context) => myTheme)
        ],
        child: BlocBuilder<ThemeBloc, bool>(
          bloc: myTheme,
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: state == true ? ThemeData.light() : ThemeData.dark(),
              home: const HomePage(),
            );
          },
        ));
  }
}

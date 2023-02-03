import 'package:flutter/material.dart';

import './bloc/export.dart';
import './pages/home/home.dart';
import 'data/repositories/random_repository.dart';

class App extends StatelessWidget {
  App({super.key});

  final RandomRepository randomRepository = RandomRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RandomBloc(randomRepository)),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

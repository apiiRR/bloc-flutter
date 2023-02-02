import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';
import '../home/home_page.dart';
import '../other/other_page.dart';

class MyRouter {
  final Counter myCounter = Counter();
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: const HomePage(),
                ));
      case "/other":
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: const OtherPage(),
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: myCounter,
                  child: const OtherPage(),
                ));
    }
  }
}

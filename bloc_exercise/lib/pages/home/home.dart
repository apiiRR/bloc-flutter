import 'package:flutter/material.dart';
import '../../bloc/export.dart';
import '../../data/models/data_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RandomBloc randomBloc = context.read<RandomBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("RANDOM APPS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: BlocBuilder<RandomBloc, RandomState>(
            bloc: randomBloc,
            builder: (context, state) {
              if (state is RandomLoading) {
                return const CircularProgressIndicator();
              }
              if (state is RandomError) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Terjadi Kesalahan"),
                    Text(state.error),
                  ],
                );
              }
              if (state is RandomInitial) {
                return const Text("Tidak ada data");
              }

              DataHomeModel dataHome = state.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: Image.network("${dataHome.profile}"),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${dataHome.fullname}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("${dataHome.email}"),
                  const SizedBox(height: 20),
                  const Text("============== MASAKAN =============="),
                  const SizedBox(height: 20),
                  Text(
                    "${dataHome.masakan}",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text("${dataHome.porsi}"),
                  const SizedBox(height: 5),
                  Text("Tingkat kesulitan ( ${dataHome.kesulitan} )"),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.network("${dataHome.gambarMasakan}"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          randomBloc.add(GetRandomEvent());
          randomBloc.state.data.toJson();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

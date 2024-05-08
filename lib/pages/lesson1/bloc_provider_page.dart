import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/sample_first_bloc.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {

    //context.read<SampleFirstBloc>();

    return BlocProvider(
      create: (context) => SampleFirstBloc(),
      lazy: false,
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bloc Provider"),
      ),
      body: const Center(
        child: Text(" Bloc Provider Sample"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleFirstBloc>().add(SampleFirstEvent());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

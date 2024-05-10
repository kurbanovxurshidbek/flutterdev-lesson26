import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo23/repository/first_repository.dart';

import '../../bloc/repository_first_bloc.dart';

class SingleRepositoryPage extends StatefulWidget {
  const SingleRepositoryPage({super.key});

  @override
  State<SingleRepositoryPage> createState() => _SingleRepositoryPageState();
}

class _SingleRepositoryPageState extends State<SingleRepositoryPage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirstRepository(),
      child: BlocProvider(
        create: (context) => RepositoryFirstBloc(context.read<FirstRepository>()),
        child: SamplePage(),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Repository Provider"),
      ),
      body: Center(
        child: BlocBuilder<RepositoryFirstBloc, int>(
          builder: (context, state) => Text(
            state.toString(),
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          context.read<RepositoryFirstBloc>().add(RepositoryFirstEvent());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo23/bloc/movie_cubit.dart';
import 'package:ngdemo23/repository/movie_repository.dart';
import 'package:ngdemo23/services/log_service.dart';

import '../../bloc/movie_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MovieRepository(),
      child: BlocProvider(
        //create: (context) => MovieBloc(context.read<MovieRepository>()),
        create: (context) => MovieCubit(context.read<MovieRepository>()),
        child: SampleCubitPage(),
      ),
    );
  }
}

class SampleCubitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Search Movies"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                LogService.i(value);
                context.read<MovieCubit>().search(value);
              },
            ),
            Expanded(
              child: BlocBuilder<MovieCubit, List<String>>(
                builder: (context, state) {
                  return ListView.separated(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(state[index]),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemCount: state.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SampleBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Search Movies"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                LogService.i(value);
                context.read<MovieBloc>().add(SearchMovieEvent(value));
              },
            ),
            Expanded(
              child: BlocBuilder<MovieBloc, List<String>>(
                builder: (context, state) {
                  return ListView.separated(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(state[index]),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemCount: state.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

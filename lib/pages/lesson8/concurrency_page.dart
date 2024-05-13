import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo23/repository/concurrency_repository.dart';

import '../../bloc/concurrency_bloc.dart';

class ConcurrencyPage extends StatefulWidget {
  const ConcurrencyPage({super.key});

  @override
  State<ConcurrencyPage> createState() => _ConcurrencyPageState();
}

class _ConcurrencyPageState extends State<ConcurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ConcurrencyRepository(),
      child: BlocProvider(
        create: (context) =>
            ConcurrencyBloc(context.read<ConcurrencyRepository>()),
        child: SamplePage(),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Pick Images"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            BlocBuilder<ConcurrencyBloc, ShowImageState>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.count >= 0)
                      Text(
                        state.count.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                    Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: 400,
                      child: state.path == ''
                          ? Container()
                          : Image(
                              image: AssetImage('assets/images/${state.path}'),
                              fit: BoxFit.fill,
                            ),
                    ),
                  ],
                );
              },
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                context.read<ConcurrencyBloc>().add(ShowImageEvent());
              },
              child: Text("Get Image"),
            ),
          ],
        ),
      ),
    );
  }
}

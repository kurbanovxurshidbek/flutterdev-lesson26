import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo23/bloc/sample_first_bloc.dart';

import '../../bloc/sample_second_bloc.dart';

class MultiBlocProviderPage extends StatefulWidget {
  const MultiBlocProviderPage({super.key});

  @override
  State<MultiBlocProviderPage> createState() => _MultiBlocProviderPageState();
}

class _MultiBlocProviderPageState extends State<MultiBlocProviderPage> {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => SampleFirstBloc(),
    //   child: BlocProvider(
    //     create: (context) => SampleSecondBloc(),
    //     child: const SamplePage()
    //   ),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SampleFirstBloc(),
        ),
        BlocProvider(
          create: (context) => SampleSecondBloc(),
        ),
      ],
      child: const SamplePage(),
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
        title: const Text("Multi Bloc Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Bloc Provider Sample'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      context.read<SampleFirstBloc>().add(SampleFirstEvent());
                    },
                    child: const Text('+')),
                const SizedBox(width: 15),
                MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      context.read<SampleSecondBloc>().add(SampleSecondEvent());
                    },
                    child: const Text('-')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

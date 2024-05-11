import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo23/bloc/sample_first_bloc.dart';
import 'package:ngdemo23/services/log_service.dart';

class BlocListenerPage extends StatefulWidget {
  const BlocListenerPage({super.key});

  @override
  State<BlocListenerPage> createState() => _BlocListenerPageState();
}

class _BlocListenerPageState extends State<BlocListenerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleFirstBloc(),
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  late SampleFirstBloc sampleBloc;

  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Title'),
          content: BlocBuilder<SampleFirstBloc, int>(
            bloc: sampleBloc,
            builder: (context, state) {
              return Text(state.toString());
            },
          ),
          actions: [
            ElevatedButton(
              child: const Text("Okay"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    sampleBloc = context.read<SampleFirstBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bloc Listener"),
      ),
      body: Center(

        child: BlocListener<SampleFirstBloc, int>(
          listenWhen: (previous, current) => current > 5,
          listener: (context, state) {
            LogService.w("BlocListener");
            _showMessage(context);
          },
          child: BlocBuilder<SampleFirstBloc, int>(
            buildWhen: (previous, current) => current > 5,
            builder: (context, state){
              return Text(
                context.read<SampleFirstBloc>().state.toString(),
                style: TextStyle(fontSize: 70),
              );
            },
          ),
        ),

        // child: BlocListener<SampleFirstBloc, int>(
        //   listenWhen: (previous, current) => current > 5,
        //   listener: (context, state) {
        //     LogService.w("BlocListener");
        //   },
        //   child: Text(
        //     context.read<SampleFirstBloc>().state.toString(),
        //     style: TextStyle(fontSize: 70),
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          context.read<SampleFirstBloc>().add(AddSampleEvent());
        },
      ),
    );
  }
}

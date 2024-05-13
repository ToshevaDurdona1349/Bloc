import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo23/pages/lesson1/bloc_provider_page.dart';

import '../../bloc/sample_first_bloc.dart';

class BlocConsumerPage extends StatefulWidget {
  const BlocConsumerPage({super.key});

  @override
  State<BlocConsumerPage> createState() => _BlocConsumerPageState();
}

class _BlocConsumerPageState extends State<BlocConsumerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context)=>SampleFirstBloc(),
      child:  SamplePage(),
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
        title: Text("Bloc Consumer"),
      ),
      body: Center(
        child: BlocConsumer<SampleFirstBloc, int>(
          listenWhen: (provious,current)=>current>5,
          listener:  (context,state){
            _showMessage(context);
          },
          buildWhen:(provious,current)=>current %2==0 ,
          builder: (context,state)=>Text(
            state.toString(),
            style: TextStyle(fontSize: 60),
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
          context.read<SampleFirstBloc>().add(AddSampleEvent());
        },
      ),
    );
  }
}
void _showMessage(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: const Text('Title'),
        content: const Text('Dialog Content'),
        actions: [
          ElevatedButton(
            child: const Text("확인"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}


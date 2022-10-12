import 'package:bloc_flutter_4_0/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter BLoC'),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, stateColor) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AnimatedContainer(
              height: 100,
              width: 100,
              color: stateColor,
              duration: const Duration(milliseconds: 500),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _bloc.add(eventGreen());
            },
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              _bloc.add(eventRed());
            },
          ),
        ],
      ),
    );
  }
}

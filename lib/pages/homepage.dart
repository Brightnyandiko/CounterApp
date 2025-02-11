import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../counter_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You have pushed the button this many times"),
                Text(
                  value.count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //get access to the counter class
              final counter = context.read<CounterModel>();

              //increment
              counter.increment();
            },
            tooltip: "Increment",
            child: const Icon(Icons.add),
          ),
        )
    );
  }
}

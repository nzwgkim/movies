import 'package:flutter/material.dart';
import 'package:movies/src/component/count_view.dart';
import 'package:movies/src/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({super.key});
  late CounterProvider countProvider;

  @override
  Widget build(BuildContext context) {
    countProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counting Provider"),
      ),
      body: const CountView(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => countProvider.add(),
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => countProvider.subtract(),
          ),
        ],
      ),
    );
  }
}

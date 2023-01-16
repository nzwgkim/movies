import 'package:flutter/material.dart';
// import 'package:flutter_provider_sample/src/provider/counter_provider.dart';
import 'package:movies/src/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CountView extends StatelessWidget {
  const CountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Provider.of<CounterProvider>(context).count.toString(),
        style: const TextStyle(fontSize: 60),
      ),
    );
    // return Center(
    //   child: Consumer<CounterProvider>(builder: (context, provider, child) {
    //     return Text(
    //       provider.count.toString(),
    //     );
    //   }),
    // );
  }
}

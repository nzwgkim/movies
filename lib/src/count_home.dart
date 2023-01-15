import 'package:flutter/material.dart';
import 'package:movies/src/counter_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key? key}) : super(key: key);
  late CounterProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CounterProvider>(context, listen: false);
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
            onPressed: () => _countProvider.add(),
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => _countProvider.remove(),
          ),
        ],
      ),
    );
  }
}

// class CountHomeWidget extends StatelessWidget {
//   const CountHomeWidget({
//     Key? key,
//     required CounterProvider counterProvider,
//   })  : _counterProvider = counterProvider,
//         super(key: key);

//   final CounterProvider _counterProvider;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               _counterProvider.counter.toString(),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CountView extends StatelessWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Provider.of<CounterProvider>(context).counter.toString(),
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

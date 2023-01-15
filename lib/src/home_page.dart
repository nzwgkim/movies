import 'package:flutter/material.dart';
import 'package:movies/src/buttom_nav_provider.dart';
import 'package:movies/src/counter_provider.dart';
import 'package:movies/src/movie_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late CounterProvider _counterProvider;
  late BottomNavProvider _bottomNavProvider;

  @override
  Widget build(BuildContext context) {
    _counterProvider = Provider.of<CounterProvider>(context);
    _bottomNavProvider = Provider.of<BottomNavProvider>(context);
    // print(_counterProvider.counter);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
        ),
        body: MovieListWidget(),
        // CountHomeWidget(counterProvider: _counterProvider),
        // _bottomNavProvider.currentPage==1?CountHomeWidget(counterProvider: _counterProvider): MovieList(),
        floatingActionButton: AddRemoveButtons(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
          ],
          currentIndex: _bottomNavProvider.currentPage,
          selectedItemColor: Colors.red.shade600,
          onTap: (value) {
            _bottomNavProvider.updateIndexPage(value);
          },
        )
        //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
        //   Icon(
        //     Icons.home,
        //     size: 50,
        //   ),
        //   Icon(
        //     Icons.movie_filter_outlined,
        //     size: 50,
        //   )
        // ]), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Row AddRemoveButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            _counterProvider.add();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            _counterProvider.remove();
          },
          tooltip: 'Descrement',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

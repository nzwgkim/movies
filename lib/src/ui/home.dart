import 'package:flutter/material.dart';
import 'package:movies/src/provider/bottom_navigation_provider.dart';
import 'package:movies/src/ui/count_page.dart';
import 'package:movies/src/ui/movie_list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  late BottomNavigationProvider _bottomNavigationBar;

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Movie',
        ),
      ],
      currentIndex: _bottomNavigationBar.currentNavigationIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        _bottomNavigationBar.updatePage(index);
      },
    );
  }

  Widget _navigationBody() {
    switch (_bottomNavigationBar.currentNavigationIndex) {
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return const MovieList();
        break;
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationBar = Provider.of<BottomNavigationProvider>(context);
    print("updatePage");
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(), // listen true일때
      // bottomNavigationBar: Consumer<ButtomNavigationProvider>(  // listen false 일때
      //   builder: (BuildContext context, ButtomNavigationProvider value,
      //       Widget child) {
      //     return _bottomNavigationBarWidget();
      //   },
      // ),
    );
  }
}

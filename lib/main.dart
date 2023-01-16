import 'package:flutter/material.dart';
import 'package:movies/src/provider/bottom_navigation_provider.dart';
import 'package:movies/src/provider/counter_provider.dart';
import 'package:movies/src/provider/movie_provider.dart';
import 'package:movies/src/ui/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(providers: [
          ChangeNotifierProvider<CounterProvider>(
            create: (_) => CounterProvider(),
          ),
          ChangeNotifierProvider<BottomNavigationProvider>(
            create: (_) => BottomNavigationProvider(),
          ),
          ChangeNotifierProvider<MovieProvider>(
            create: (_) => MovieProvider(),
          ),
        ], child: Home()));
  }
}

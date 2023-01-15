import 'package:flutter/material.dart';
import 'package:movies/src/buttom_nav_provider.dart';
import 'package:movies/src/counter_provider.dart';
import 'package:movies/src/home_page.dart';
import 'package:movies/src/movie_provider.dart';
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
          ChangeNotifierProvider<BottomNavProvider>(
            create: (_) => BottomNavProvider(),
          ),
          ChangeNotifierProvider<MovieProvider>(
            create: (_) => MovieProvider(),
          ),
        ], child: HomePage()));
  }
}

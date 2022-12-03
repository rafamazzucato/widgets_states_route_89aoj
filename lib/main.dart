import 'package:flutter/material.dart';
import 'package:widgets_states_route/screens/form.dart';
import 'package:widgets_states_route/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeWidget(),
        '/form': (context) => LanguagesFormWidget()
      },
    );
  }
}

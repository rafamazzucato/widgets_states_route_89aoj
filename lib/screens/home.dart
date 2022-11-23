import 'package:flutter/material.dart';
import 'package:widgets_states_route/models/language.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final title = const Text("Minhas lingagens");

  List<Language> languages = [
    Language("Android Nativo", "Linguagens C, Java e Kotlin",
        "assets/images/android.png"),
    Language("iOS Nativo", "Linguagens Objective-C, e Swift",
        "assets/images/ios.png"),
    Language("Flutter", "Linguagem Dart", "assets/images/flutter.png"),
    Language("React Native", "Linguagens Javascript e Typescript",
        "assets/images/native.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: Column(children: [
        Wrap(children: _buildChoices()),
        Expanded(child: ListView(children: _buildListItems()))
      ]),
    );
  }

  List<Widget> _buildChoices() {
    return languages
        .map((language) => ChoiceChip(
            label: Text(language.name),
            selected: language.selected,
            onSelected: (selected) {
              setState(() {
                language.selected = selected;
              });
            }))
        .toList();
  }

  List<Widget> _buildListItems() {
    return languages
        .where((language) => language.selected)
        .map((language) => Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Card(
                child: ListTile(
              leading: Image.asset(language.image, width: 48),
              title: Text(language.name),
              subtitle: Text(language.description),
            ))))
        .toList();
  }
}

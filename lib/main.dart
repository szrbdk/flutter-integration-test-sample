import 'package:flutter/material.dart';
import 'package:integration_test_example/pages/counter.dart';
import 'package:integration_test_example/pages/scroll_and_find.dart';
import 'package:integration_test_example/pages/swipe.dart';
import 'package:integration_test_example/pages/text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Integration Test Example',
      home: Onboarding(),
    );
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pages"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Card(
              key: const Key("CounterCardKey"),
              child: ListTile(
                title: const Text("Counter"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterPage()));
                },
              ),
            ),
            Card(
              key: const Key("SwipeButtonKey"),
              child: ListTile(
                title: const Text("Swipe"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SwipePage()));
                },
              ),
            ),
            Card(
              key: const Key("TextFieldButtonKey"),
              child: ListTile(
                title: const Text("Text Field"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TextFieldPage()));
                },
              ),
            ),
            Card(
              key: const Key("ScrollButtonKey"),
              child: ListTile(
                title: const Text("Scroll And Find"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ScrollAndFind()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

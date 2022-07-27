import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final formKey = GlobalKey<FormState>();

  String? item1;
  String? item2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Field"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                key: const Key("TextFieldKey1"),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Item 1",
                ),
                onSaved: (newValue) {
                  item1 = newValue == "" ? "Item 1" : newValue;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key("TextFieldKey2"),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Item 2",
                ),
                onSaved: (newValue) {
                  item2 = newValue == "" ? "Item 2" : newValue;
                },
              ),
              ElevatedButton(
                child: const Text("Save"),
                onPressed: () {
                  formKey.currentState?.save();
                  setState(() {});
                },
              ),
              Text(
                item1 ?? "Item 1",
                style: const TextStyle(fontSize: 48),
              ),
              Text(
                item2 ?? "Item 2",
                style: const TextStyle(fontSize: 48),
              )
            ],
          ),
        ),
      ),
    );
  }
}

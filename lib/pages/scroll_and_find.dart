import 'package:flutter/material.dart';

class ScrollAndFind extends StatefulWidget {
  static const listKey =  Key("ListKey");

  const ScrollAndFind({Key? key}) : super(key: key);

  @override
  State<ScrollAndFind> createState() => _ScrollAndFindState();
}

class _ScrollAndFindState extends State<ScrollAndFind> {
  late List<int> items;

  @override
  void initState() {
    super.initState();
    items = List.generate(100, (index) => index);
  }

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scroll And Find"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          key: ScrollAndFind.listKey,
          itemCount: 100,
          controller: controller,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                tileColor: Colors.orange,
                title: Text("Item: $index"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShowItem(item: index)));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShowItem extends StatelessWidget {
  final int item;
  const ShowItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ITEM"),
      ),
      body: Center(
        child: Text(
          "$item",
          style: const TextStyle(fontSize: 56),
        ),
      ),
    );
  }
}

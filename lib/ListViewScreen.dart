import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget{
  const ListViewScreen({super.key});


  Widget build(BuildContext context ){
    final List<String> items = List.generate(10,(i) => "lab task item $i");
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Practice")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.label),
            title: Text(items[index]),
            subtitle: Text("Description for item $index"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Tapped on ${items[index]}")),
              );
            },
          );
        },
      ),
    );
  }
}

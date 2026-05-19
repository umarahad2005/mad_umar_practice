import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: lab6task1(),
    );
  }
}

class lab6task1 extends  StatefulWidget {
   const lab6task1({super.key});
   State<lab6task1> createState() => _lab6task1State();

}
class _lab6task1State extends State<lab6task1> {
final _formKey = GlobalKey<FormState>();

 Widget build(  BuildContext context){

  return Scaffold(
    appBar: AppBar(
      title: const Text("Registration Form"),
    ),
    body : SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'what is your name', border: OutlineInputBorder()),
              validator:(value) {
                if (value == null || value.isEmpty) return "Name required";
                if (value.length < 6) return "Name must be at least 6 chars";
                return null;
              },
            ),
            const SizedBox(height: 15),

            // Score Field
            TextFormField(
              decoration: const InputDecoration(hintText: 'what is your score', border: OutlineInputBorder()),
              validator: (value) => (value == null || value.isEmpty) ? "Score required" : null,
            ),
            const SizedBox(height: 15),

            // Gender Dropdown
            DropdownButtonFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              hint: const Text("Select gender"),
              items: ["Male", "Female"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) {},
              validator: (v) => v == null ? "Select gender" : null,
            ),
            const SizedBox(height: 15),

            // Username Field [cite: 186]
            TextFormField(
              decoration: const InputDecoration(hintText: 'what is the chosen username', border: OutlineInputBorder()),
              validator: (value) => (value == null || value.isEmpty) ? "Username required" : null,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Logic for successful validation
                }
              },
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    ),
  );
}
}

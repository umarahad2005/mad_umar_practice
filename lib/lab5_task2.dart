import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5 - Form Validation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

// ─── Order Model ─────────────────────────────────────────────────────────────

class Order {
  String? item;
  int? quantity;
}

// ─── Home Screen ─────────────────────────────────────────────────────────────

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  // Order to Save
  Order _order = Order();

  // Validates that the item field is not empty
  String? _validateItemRequired(String? value) {
    return (value == null || value.isEmpty) ? 'Item Required' : null;
  }

  // Validates that quantity is at least 1
  String? _validateItemCount(String? value) {
    int _valueAsInteger =
    (value == null || value.isEmpty) ? 0 : (int.tryParse(value) ?? 0);
    return _valueAsInteger == 0 ? 'At least one Item is Required' : null;
  }

  // Called when Save button is pressed
  void _submitOrder() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');

      // Show a snackbar to confirm
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Order saved! Item: ${_order.item}, Qty: ${_order.quantity}',
          ),
          backgroundColor: Colors.lightGreen,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 5 - Form Validation'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    // Item field
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Espresso',
                        labelText: 'Item',
                      ),
                      validator: (value) => _validateItemRequired(value),
                      onSaved: (value) => _order.item = value,
                    ),

                    // Quantity field
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '3',
                        labelText: 'Quantity',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => _validateItemCount(value),
                      onSaved: (value) =>
                      _order.quantity = int.tryParse(value ?? '0'),
                    ),

                    const Divider(height: 32.0),

                    // Save Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      onPressed: () => _submitOrder(),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
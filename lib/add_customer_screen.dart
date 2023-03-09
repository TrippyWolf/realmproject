import 'package:flutter/material.dart';
import 'package:realmproject/realm_operations.dart';

class AddCustomerScreen extends StatefulWidget {
  final RealmOperations realmOperations;

  const AddCustomerScreen({Key? key, required this.realmOperations}) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Customer"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _textEditingController,
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                if (_textEditingController.text.isNotEmpty) {
                  widget.realmOperations.addCustomer(_textEditingController.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Name added successfully")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Give name")));
                }
              },
              child: const Text("Add")),
        ],
      ),
    );
  }
}

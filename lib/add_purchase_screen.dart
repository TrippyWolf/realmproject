import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realmproject/realm_model/customer_model.dart';
import 'package:realmproject/realm_operations.dart';

class AddPurchaseOrder extends StatefulWidget {
  final RealmOperations realmOperations;
  final Customer customer;

  const AddPurchaseOrder({Key? key, required this.realmOperations, required this.customer})
      : super(key: key);

  @override
  State<AddPurchaseOrder> createState() => _AddPurchaseOrderState();
}

class _AddPurchaseOrderState extends State<AddPurchaseOrder> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Purchase order"),
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
                  widget.realmOperations.addPurchaseOrder(
                      Purchase(ObjectId(), _textEditingController.text, DateTime.now()),
                      widget.customer);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Purchase added successfully")));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Give value")));
                }
              },
              child: const Text("Add")),
        ],
      ),
    );
  }
}

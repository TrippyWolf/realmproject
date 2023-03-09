import 'package:flutter/material.dart';
import 'package:realmproject/realm_model/customer_model.dart';
import 'package:realmproject/realm_operations.dart';

class UpdateCustomerScreen extends StatefulWidget {
  final RealmOperations realmOperations;
  final Customer customer;

  const UpdateCustomerScreen({Key? key, required this.realmOperations, required this.customer})
      : super(key: key);

  @override
  State<UpdateCustomerScreen> createState() => _UpdateCustomerScreenState();
}

class _UpdateCustomerScreenState extends State<UpdateCustomerScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    _textEditingController.text = widget.customer.customerName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Customer"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _textEditingController,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(widget.customer.purchaseList[index].purchaseId.toString()),
                  title: Text(widget.customer.purchaseList[index].purchaseValue.toString()),
                  subtitle: Text(widget.customer.purchaseList[index].timeStamp.toString()),
                );
              },
              itemCount: widget.customer.purchaseList.length,
            ),
          ),
          TextButton(
              onPressed: () {
                if (_textEditingController.text.isNotEmpty) {
                  widget.realmOperations
                      .updateCustomer(widget.customer, _textEditingController.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Name updated successfully")));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Give name")));
                }
              },
              child: const Text("Update")),
        ],
      ),
    );
  }
}

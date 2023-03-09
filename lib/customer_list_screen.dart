import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realmproject/add_purchase_screen.dart';
import 'package:realmproject/realm_model/customer_model.dart';
import 'package:realmproject/realm_operations.dart';
import 'package:realmproject/update_customer_screen.dart';

class CustomerListScreen extends StatefulWidget {
  final RealmOperations realmOperations;

  const CustomerListScreen({
    Key? key,
    required this.realmOperations,
  }) : super(key: key);

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  late RealmResults<Customer> realmResults;

  @override
  void initState() {
    realmResults = widget.realmOperations.getCustomerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer List"),
      ),
      body: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<RealmResultsChanges<Customer>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddPurchaseOrder(
                              realmOperations: widget.realmOperations,
                              customer: snapshot.data!.results.elementAt(index),
                            )));
                  },
                  onLongPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateCustomerScreen(
                              realmOperations: widget.realmOperations,
                              customer: snapshot.data!.results.elementAt(index),
                            )));
                  },
                  leading: Text(snapshot.data!.results.elementAt(index).customerAge.toString()),
                  title: Text(snapshot.data!.results.elementAt(index).customerName),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      widget.realmOperations
                          .deleteCustomer(snapshot.data!.results.elementAt(index));
                    },
                  ),
                );
              },
              itemCount: snapshot.data!.results.length,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
        stream: realmResults.changes,
      ),
      // body: ListView.builder(
      //   itemBuilder: (ctx, index) {
      //     return ListTile(
      //       leading: Text(realmResults.elementAt(index).customerId.toString()),
      //       title: Text(realmResults.elementAt(index).customerName),
      //       trailing: IconButton(
      //         icon: const Icon(Icons.delete),
      //         onPressed: () {
      //           widget.realmOperations.deleteCustomer(realmResults.elementAt(index));
      //         },
      //       ),
      //     );
      //   },
      //   itemCount: realmResults.length,
      // ),
    );
  }
}

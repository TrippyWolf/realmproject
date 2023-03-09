import 'package:realm/realm.dart';
import 'package:realmproject/realm_model/customer_model.dart';

import 'large_json_example/actor_model.dart';

class RealmOperations {
  late final Realm realm;
  late final Realm realm2;
  Future<void> init() async {
    // final app = App(AppConfiguration('realmpoc-wikbm'));
    // final user = await app.logIn(Credentials.anonymous());
    final config = Configuration.local(
        [Customer.schema, Purchase.schema, Actor.schema, BollyWood.schema],
        schemaVersion: 7,
        disableFormatUpgrade: true,
        maxNumberOfActiveVersions: 1, migrationCallback: (migration, oldSchema) {
      realm = migration.newRealm;
    });

    realm = Realm(config);
    // realm.close();//Realm error : Cannot access realm that has been closed
    realm2 = Realm(config);

    // realm.subscriptions.update((mutableSubscriptions) {
    //   mutableSubscriptions.add(realm.all<Customer>());
    //   mutableSubscriptions.add(realm.all<Purchase>());
    // });
    // await realm.subscriptions.waitForSynchronization();
  }

  void addPurchaseOrder(Purchase purchase, Customer customer) {
    realm.write(() {
      customer.purchaseList.add(purchase);
      realm.add(customer, update: true);
    });
  }

  void addCustomer(String customerName) {
    realm.writeAsync(() {
      ObjectId objectId = ObjectId();
      realm.add<Customer>(Customer(objectId, customerName, DateTime.now()));
      realm.add<Customer>(Customer(ObjectId(), customerName, DateTime.now()));
    });
    // realm.subscriptions.update((mutableSubscriptions) {
    //   mutableSubscriptions.clear();
    //   mutableSubscriptions.add(realm.write(() => null))
    // });
  }

  void deleteCustomer(Customer customer) {
    realm.write(() {
      realm.delete<Customer>(customer);
    });
  }

  void updateCustomer(Customer customer, String name) {
    realm.write(() {
      customer.customerName = name;
      realm.add(customer, update: true);
    });
  }

  RealmResults<Customer> getCustomerList() {
    RealmResults<Customer> realmResults = realm.all<Customer>();
    return realmResults;
  }
}

/*
  Registering schemas
  abstract class for CRUD
  Query filter based
  Multiple insert in single transaction
  Db access via two transaction at same time
  Singleton instance of realm
  Transaction of realm
  Migration
  trigger function
  Error validation - very important
  deleting the entire data of the db.
  Import and export of data without cloud.
 */

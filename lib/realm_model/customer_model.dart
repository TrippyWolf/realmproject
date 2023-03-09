import 'package:realm/realm.dart';

part 'customer_model.g.dart';

// part 'schema.g.dart'
@RealmModel()
class _Customer {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId customerId;

  late List<_Purchase> purchaseList = [];
  late String customerName;
  String customerAge = "22";
  late DateTime customerCreationTimeStamp;
}

@RealmModel()
class _Purchase {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId purchaseId;
  late String purchaseValue;
  late DateTime timeStamp;
}

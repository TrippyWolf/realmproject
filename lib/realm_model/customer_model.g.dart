// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Customer extends _Customer
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Customer(
    ObjectId customerId,
    String customerName,
    DateTime customerCreationTimeStamp, {
    String customerAge = "22",
    Iterable<Purchase> purchaseList = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Customer>({
        'customerAge': "22",
      });
    }
    RealmObjectBase.set(this, '_id', customerId);
    RealmObjectBase.set(this, 'customerName', customerName);
    RealmObjectBase.set(this, 'customerAge', customerAge);
    RealmObjectBase.set(
        this, 'customerCreationTimeStamp', customerCreationTimeStamp);
    RealmObjectBase.set<RealmList<Purchase>>(
        this, 'purchaseList', RealmList<Purchase>(purchaseList));
  }

  Customer._();

  @override
  ObjectId get customerId =>
      RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set customerId(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  RealmList<Purchase> get purchaseList =>
      RealmObjectBase.get<Purchase>(this, 'purchaseList')
          as RealmList<Purchase>;
  @override
  set purchaseList(covariant RealmList<Purchase> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get customerName =>
      RealmObjectBase.get<String>(this, 'customerName') as String;
  @override
  set customerName(String value) =>
      RealmObjectBase.set(this, 'customerName', value);

  @override
  String get customerAge =>
      RealmObjectBase.get<String>(this, 'customerAge') as String;
  @override
  set customerAge(String value) =>
      RealmObjectBase.set(this, 'customerAge', value);

  @override
  DateTime get customerCreationTimeStamp =>
      RealmObjectBase.get<DateTime>(this, 'customerCreationTimeStamp')
          as DateTime;
  @override
  set customerCreationTimeStamp(DateTime value) =>
      RealmObjectBase.set(this, 'customerCreationTimeStamp', value);

  @override
  Stream<RealmObjectChanges<Customer>> get changes =>
      RealmObjectBase.getChanges<Customer>(this);

  @override
  Customer freeze() => RealmObjectBase.freezeObject<Customer>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Customer._);
    return const SchemaObject(ObjectType.realmObject, Customer, 'Customer', [
      SchemaProperty('customerId', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('purchaseList', RealmPropertyType.object,
          linkTarget: 'Purchase', collectionType: RealmCollectionType.list),
      SchemaProperty('customerName', RealmPropertyType.string),
      SchemaProperty('customerAge', RealmPropertyType.string),
      SchemaProperty('customerCreationTimeStamp', RealmPropertyType.timestamp),
    ]);
  }
}

class Purchase extends _Purchase
    with RealmEntity, RealmObjectBase, RealmObject {
  Purchase(
    ObjectId purchaseId,
    String purchaseValue,
    DateTime timeStamp,
  ) {
    RealmObjectBase.set(this, '_id', purchaseId);
    RealmObjectBase.set(this, 'purchaseValue', purchaseValue);
    RealmObjectBase.set(this, 'timeStamp', timeStamp);
  }

  Purchase._();

  @override
  ObjectId get purchaseId =>
      RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set purchaseId(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get purchaseValue =>
      RealmObjectBase.get<String>(this, 'purchaseValue') as String;
  @override
  set purchaseValue(String value) =>
      RealmObjectBase.set(this, 'purchaseValue', value);

  @override
  DateTime get timeStamp =>
      RealmObjectBase.get<DateTime>(this, 'timeStamp') as DateTime;
  @override
  set timeStamp(DateTime value) =>
      RealmObjectBase.set(this, 'timeStamp', value);

  @override
  Stream<RealmObjectChanges<Purchase>> get changes =>
      RealmObjectBase.getChanges<Purchase>(this);

  @override
  Purchase freeze() => RealmObjectBase.freezeObject<Purchase>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Purchase._);
    return const SchemaObject(ObjectType.realmObject, Purchase, 'Purchase', [
      SchemaProperty('purchaseId', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('purchaseValue', RealmPropertyType.string),
      SchemaProperty('timeStamp', RealmPropertyType.timestamp),
    ]);
  }
}

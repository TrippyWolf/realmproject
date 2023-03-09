import 'package:realm/realm.dart';

///Writing generic class for Realm Operations
///All write functions serve two purpose write and update.
abstract class DbOperation<T extends RealmObject> {
  late Realm realm;
  T dbWrite(T obj, [bool update = false]) {
    return realm.write<T>(() {
      return realm.add<T>(obj, update: update);
    });
  }

  ///Returns future sync Caller of this function must wait
  ///For example if we are doing master download and writing to db
  ///so we need to either wait or handle it asynchronolously for this function to end properly
  Future<T> dbWriteAsync(T obj, [bool update = false]) async {
    return realm.writeAsync<T>(() {
      return realm.add<T>(obj, update: update);
    });
  }

  ///NO return in mutliple write
  ///TODO Learn more about addAll function
  Future<void> dbMultipleWriteAsync(Iterable<T> obj, [bool update = false]) async {
    realm.writeAsync(() => realm.addAll<T>(obj, update: update));
  }

  void dbMultipleWrite(Iterable<T> obj, [bool update = false]) {
    realm.write(() => realm.addAll<T>(obj, update: update));
  }

  void dbDeleteSingle(T obj) {
    realm.write(() {
      realm.delete<T>(obj);
    });
  }

  void dbDeleteAll() {
    realm.write(() {
      realm.deleteAll<T>();
    });
  }

  void dbDeleteMultiple(Iterable<T> obj) {
    realm.write(() {
      realm.deleteMany(obj);
    });
  }

  T? dbFindByPrimaryKey(Object id) {
    return realm.find(id);
  }

  //https://academy.realm.io/posts/nspredicate-cheatsheet/
  ///pre-define function needs to be created for Realm for accessing filtered db
  ///Realm using its own realm query language and its more error prone I found
  RealmResults<RealmObject> dbFindByQuery(String query) {
    return realm.query(query);
  }

  ///Customer name search query for example
  RealmResults<RealmObject> dbFindByName(String parameterName, String name) {
    return realm.query("$parameterName == $name");
  }

  RealmResults<T> dbGetALl() {
    return realm.all<T>();
  }
}

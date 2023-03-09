import 'package:realmproject/dboperation.dart';
import 'package:realmproject/large_json_example/actor_model.dart';

class ActorRepository extends DbOperation<BollyWood> {
  Future<void> storeActorList(List<BollyWood> myList) async {
    dbMultipleWriteAsync(myList);
  }
}

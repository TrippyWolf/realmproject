import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'actor_model.g.dart';

// part 'schema.g.dart'

@JsonSerializable()
@RealmModel()
class $Actor {
  late int id;

  late String login;
  late String url;
  late String avatar_url;
  static $Actor fromJson(Map<String, dynamic> json) => _$$ActorFromJson(json);
  Map<String, dynamic> toJson() => _$$ActorToJson(this);
}

extension ActorJ on Actor {
  static Actor toRealmObject($Actor actor) {
    return Actor(
      actor.id,
      actor.login,
      actor.url,
      actor.avatar_url,
    );
  }

  static Actor fromJson(Map<String, dynamic> json) => toRealmObject(_$$ActorFromJson(json));
  Map<String, dynamic> toJson() => _$$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
@RealmModel()
class $BollyWood {
  @PrimaryKey()
  late String id;
  late String type;
  late $Actor? actor;
  late DateTime created_at;
}

extension BollyWoodJ on $BollyWood {
  static BollyWood toRealmObject($BollyWood bollywood) {
    return BollyWood(bollywood.id, bollywood.type, bollywood.created_at,
        actor: ActorJ.toRealmObject(bollywood.actor!));
  }

  static BollyWood fromJson(Map<String, dynamic> json) => toRealmObject(_$$BollyWoodFromJson(json));
  Map<String, dynamic> toJson() => _$$BollyWoodToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$Actor _$$ActorFromJson(Map<String, dynamic> json) => $Actor()
  ..id = json['id'] as int
  ..login = json['login'] as String
  ..url = json['url'] as String
  ..avatar_url = json['avatar_url'] as String;

Map<String, dynamic> _$$ActorToJson($Actor instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'url': instance.url,
      'avatar_url': instance.avatar_url,
    };

$BollyWood _$$BollyWoodFromJson(Map<String, dynamic> json) => $BollyWood()
  ..id = json['id'] as String
  ..type = json['type'] as String
  ..actor = json['actor'] == null
      ? null
      : $Actor.fromJson(json['actor'] as Map<String, dynamic>)
  ..created_at = DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$$BollyWoodToJson($BollyWood instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'actor': instance.actor?.toJson(),
      'created_at': instance.created_at.toIso8601String(),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Actor extends $Actor with RealmEntity, RealmObjectBase, RealmObject {
  Actor(
    int id,
    String login,
    String url,
    String avatar_url,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'login', login);
    RealmObjectBase.set(this, 'url', url);
    RealmObjectBase.set(this, 'avatar_url', avatar_url);
  }

  Actor._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get login => RealmObjectBase.get<String>(this, 'login') as String;
  @override
  set login(String value) => RealmObjectBase.set(this, 'login', value);

  @override
  String get url => RealmObjectBase.get<String>(this, 'url') as String;
  @override
  set url(String value) => RealmObjectBase.set(this, 'url', value);

  @override
  String get avatar_url =>
      RealmObjectBase.get<String>(this, 'avatar_url') as String;
  @override
  set avatar_url(String value) =>
      RealmObjectBase.set(this, 'avatar_url', value);

  @override
  Stream<RealmObjectChanges<Actor>> get changes =>
      RealmObjectBase.getChanges<Actor>(this);

  @override
  Actor freeze() => RealmObjectBase.freezeObject<Actor>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Actor._);
    return const SchemaObject(ObjectType.realmObject, Actor, 'Actor', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('login', RealmPropertyType.string),
      SchemaProperty('url', RealmPropertyType.string),
      SchemaProperty('avatar_url', RealmPropertyType.string),
    ]);
  }
}

class BollyWood extends $BollyWood
    with RealmEntity, RealmObjectBase, RealmObject {
  BollyWood(
    String id,
    String type,
    DateTime created_at, {
    Actor? actor,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'actor', actor);
    RealmObjectBase.set(this, 'created_at', created_at);
  }

  BollyWood._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  Actor? get actor => RealmObjectBase.get<Actor>(this, 'actor') as Actor?;
  @override
  set actor(covariant Actor? value) =>
      RealmObjectBase.set(this, 'actor', value);

  @override
  DateTime get created_at =>
      RealmObjectBase.get<DateTime>(this, 'created_at') as DateTime;
  @override
  set created_at(DateTime value) =>
      RealmObjectBase.set(this, 'created_at', value);

  @override
  Stream<RealmObjectChanges<BollyWood>> get changes =>
      RealmObjectBase.getChanges<BollyWood>(this);

  @override
  BollyWood freeze() => RealmObjectBase.freezeObject<BollyWood>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(BollyWood._);
    return const SchemaObject(ObjectType.realmObject, BollyWood, 'BollyWood', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('actor', RealmPropertyType.object,
          optional: true, linkTarget: 'Actor'),
      SchemaProperty('created_at', RealmPropertyType.timestamp),
    ]);
  }
}

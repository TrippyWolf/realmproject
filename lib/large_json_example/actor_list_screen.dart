import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:realm/realm.dart' as REALM;
import 'package:realmproject/large_json_example/actor_list_repo.dart';

import 'actor_model.dart';

class ActorList extends StatefulWidget {
  final REALM.Realm realm;
  const ActorList(this.realm, {Key? key}) : super(key: key);

  @override
  State<ActorList> createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {
  late Future init;

  late ActorRepository actorRepository;
  @override
  void initState() {
    actorRepository = ActorRepository();
    actorRepository.realm = widget.realm;
    actorRepository.dbDeleteAll();
    init = getJsonFromGit();
  }

  Future<void> getJsonFromGit() async {
    Uri url = Uri.parse(
        "https://raw.githubusercontent.com/json-iterator/test-data/master/large-file.json");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<BollyWood>? myModels;
      try {
        myModels = (json.decode(response.body) as List)
            .map((i) => BollyWoodJ.fromJson(i))
            .cast<BollyWood>()
            .toList();

        actorRepository.storeActorList(myModels);
        // widget.realm.writeAsync(() {
        //   REALM.ObjectId objectId = REALM.ObjectId();
        //   widget.realm.add<Customer>(Customer(objectId, "customerName", DateTime.now()));
        // });
      } catch (err) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: init,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            REALM.RealmResults<BollyWood> realmResults = actorRepository.dbGetALl();
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                // return Text(realmResults.elementAt(index).actor!.login);
                return Padding(
                  padding: const EdgeInsets.only(top: 1, bottom: 1),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image.network(realmResults.elementAt(index).actor!.avatar_url),
                    ),
                    title: Text(realmResults.elementAt(index).actor!.login),
                  ),
                );
              },
              itemCount: realmResults.length,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:dp_move/common/url_Path.dart';
import 'package:dp_move/features/movieHome/models/actor_model.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';


class RemoteActorData {



 Future<bool> connectionCheck() async {
   bool result = await InternetConnectionChecker().hasConnection;
   if(result == true) {
     return result ;
   } else {
     return result ;
   }
  }

Future<ActorModel> fetchActorData(String actorId) async {
    http.Response response =
        await http.get(Uri.parse(UrlData().actorUrl(actorId)));
          print(response.statusCode);
    if (response.statusCode == 200) {
      String pathsData = response.body;
      var decodedData = jsonDecode(pathsData);
      ActorModel actorData = ActorModel.fromJson(decodedData);
      return actorData;
    } else {
      return ActorModel(id: 0);
    }
  }
}

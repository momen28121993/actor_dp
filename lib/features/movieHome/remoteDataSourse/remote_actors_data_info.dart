import 'dart:convert';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

import '../models/poplar_model.dart';
import '/common/url_Path.dart';





class RemoteActorData {



 Future<bool> connectionCheck() async => await InternetConnectionChecker().hasConnection ;





Future<Poplar?> fetchActorData(String pageNum) async {
  try{
    http.Response response =
        await http.get(Uri.parse(UrlData().actorUrl(pageNum)));
          print(response.statusCode);
    if (response.statusCode == 200) {
      String pathsData = response.body;
      var decodedData = jsonDecode(pathsData);
      Poplar actorData = Poplar.fromJson(decodedData);
      return actorData;
    } else{
    }

  }catch(e){
    print(e.toString());
  }

}
}

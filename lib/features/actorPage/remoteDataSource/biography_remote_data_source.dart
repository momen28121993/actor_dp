
import 'dart:convert';

import 'package:http/http.dart' as http;

import '/features/actorPage/models/biography_model.dart';
import '../../../common/url_Path.dart';


class BiographyRemoteDataSource {
  fetchBiography(String actorId) async {
    http.Response response = await http.get(Uri.parse(UrlData().aboutActorUrl(actorId)));

    if (response.statusCode == 200) {
      String biogData = response.body;
      var decodedData = jsonDecode(biogData);
       BiographyModel biographyData = BiographyModel.fromJson(decodedData);
      String? biography = biographyData.biography;
      return biography;
    } else {
      return [];
    }
  }
}
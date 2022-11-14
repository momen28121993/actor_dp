import 'dart:convert';
import 'package:dp_move/features/actorPage/models/profile_model.dart';
import 'package:http/http.dart' as http;
import '../../../common/url_Path.dart';
import '../models/image_path_model.dart';



class ImagePathData {




  featchPaths(String personId) async {
    http.Response response = await http.get(Uri.parse(UrlData().urlBase(personId)));

    if (response.statusCode == 200) {
      String pathsData = response.body;
      var decodedData = jsonDecode(pathsData);
      ImagesPathList pathList = ImagesPathList.fromJson(decodedData);
      List<Profiles>? imagePaths = pathList.profiles;
      return imagePaths;
    } else {
      return [];
    }
  }
}

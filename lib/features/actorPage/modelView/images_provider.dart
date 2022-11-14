
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dp_move/features/actorPage/remoteDataSource/remote_data_images_path.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../common/url_Path.dart';
import '../models/profile_model.dart';

class ImagePathProvider extends ChangeNotifier{

   List<Profiles> pathsList = [] ;

  getFilePath(int personId) async {
    String actorId = personId.toString();
   List<Profiles> paths = await ImagePathData().featchPaths(actorId);
   return pathsList = paths ;
  }

  getPhotos(int index){
      if(pathsList.isNotEmpty){
        return Image.network('${UrlData.baseUrlForNetImage}${pathsList[index].filePath}',
         fit: BoxFit.cover,
        );
      }else{
        return Image.asset('assets/images/empty.png');
      }
  }

  dowenloadImage(int index , String name) async{
 var statue = await Permission.storage.request();
 if(statue.isGranted){
    var response = await Dio().get(
        '${UrlData.baseUrlForNetImage}${pathsList[index].filePath}',
        options: Options(responseType: ResponseType.bytes));
         await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 100,
        name: name);
    }
  }


}
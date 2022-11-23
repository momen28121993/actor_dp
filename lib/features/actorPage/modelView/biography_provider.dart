import 'package:flutter/material.dart';

import '../remoteDataSource/biography_remote_data_source.dart';

class BiographyProvider extends ChangeNotifier {
  late String biographyData ;

 getBioforActor(int actorId) async{
    String actorNum = actorId.toString();
 String  biography = await BiographyRemoteDataSource().fetchBiography(actorNum);
    biographyData = biography ;
    return biographyData ;
  }

}

import 'package:flutter/cupertino.dart';

import 'package:equatable/equatable.dart';

import '/common/url_Path.dart';
import '/features/movieHome/models/actor_model.dart';
import '/features/movieHome/remoteDataSourse/remote_actors_data_info.dart';
import '/features/movieHome/models/poplar_model.dart';
import '../../../common/photos_paths.dart';



class ActorProvider extends ChangeNotifier with EquatableMixin{
  List<Poplar> poplarAllInfo= [];
  List<ActorModel> actorsList = [];
  int pageNum = 1;
 late bool connect ;

 Future<bool> connectionCheck()async{
    bool connectionCase = await RemoteActorData().connectionCheck();
   return  connect = connectionCase ;
  }


 getActorData() async {
   poplarAllInfo.clear();
   actorsList.clear();
   String num = pageNum.toString();
    Poplar? actorData = await RemoteActorData().fetchActorData(num);
    poplarAllInfo.add(actorData!);
   actorsList = poplarAllInfo.last.actorInfo;

   return actorsList ;

  }


 addMoreActors() async {
   List<ActorModel>   newActors = [];
   pageNum = pageNum + 1 ;
    String nextNum = pageNum.toString();
    Poplar? actorData = await RemoteActorData().fetchActorData(nextNum);

    if(actorData==null){
     return addMoreActors();
    }else{
      poplarAllInfo.add(actorData);
    }

   newActors = poplarAllInfo.last.actorInfo;

   actorsList.addAll(newActors);


  notifyListeners();
  }



  imageActor(int index) {
    if (actorsList[index].profilePath != null) {
      return
        NetworkImage(
            '${UrlData.baseUrlForNetImage}${actorsList[index].profilePath}');

    } else if (actorsList[index].profilePath == null &&
        actorsList[index].gender == 1) {
      return const AssetImage(LocalPhotoPaths.femalPhPath);
    } else if (actorsList[index].profilePath == null &&
        actorsList[index].gender == 2) {
      return const AssetImage(LocalPhotoPaths.malePhPath);
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw [];
}

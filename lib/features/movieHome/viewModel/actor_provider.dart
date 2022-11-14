import 'package:dp_move/common/url_Path.dart';
import 'package:dp_move/features/movieHome/models/actor_model.dart';
import 'package:dp_move/features/movieHome/remoteDataSourse/remote_actors_data_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../common/photos_paths.dart';

class ActorProvider extends ChangeNotifier with EquatableMixin{
  List<ActorModel> actorsList = [];
  int actorNum = 7;
 late bool connect ;

  connectionCheck()async{
    bool connectionCase = await RemoteActorData().connectionCheck();
   return  connect = connectionCase ;
  }


  getActorData(String actorId) async {

    var actordata = await RemoteActorData().fetchActorData(actorId);
    return actordata;
  }

  getActorsList() async {
    actorsList.clear();
    actorNum = 7 ;
    for (int i = 0; i < actorNum; i++) {
      String num = (i + 1).toString();
      ActorModel? oneActorData = await getActorData(num);
      if (oneActorData?.id != 0) {
        actorsList.add(oneActorData!);

      } else {}
    }
    actorsList.toSet().toList();

    return actorsList;
  }

  addMoreActors() async {
    actorNum = actorNum + 5;
    for (int i = actorsList.length+1; i < actorNum; i++) {
      String num = (i + 1).toString();
      ActorModel? oneActorData = await getActorData(num);
      if (oneActorData?.id != 0) {
        actorsList.add(oneActorData!);
      }
    }
    actorsList.toSet().toList();
    notifyListeners();
  }

  // getGender(int index) {
  //   if (actorsList[index].gender == 1) {
  //     return 'femail';
  //   } else {
  //     return 'mail';
  //   }
  // }

  imageActor(int index) {
    if (actorsList[index].profilePath != null) {
      return  NetworkImage(
            '${UrlData.baseUrlForNetImage}${actorsList[index].profilePath}');

    } else if (actorsList[index].profilePath == null &&
        actorsList[index].gender == 1) {
      return AssetImage(LocalPhotoPaths.femalPhPath);
    } else if (actorsList[index].profilePath == null &&
        actorsList[index].gender == 2) {
      return AssetImage(LocalPhotoPaths.malePhPath);
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw [];
}

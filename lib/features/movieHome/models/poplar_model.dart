import 'package:dp_move/features/movieHome/models/actor_model.dart';

class Poplar {
 late final int page;
 late final List<ActorModel> actorInfo;
 late final int totalPages;
 late final int totalResults;

  Poplar({
    required this.page,
    required this.actorInfo,
    required this.totalPages,
    required this.totalResults
  });

  Poplar.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      actorInfo = <ActorModel>[];
      json['results'].forEach((v) {
        actorInfo.add(ActorModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


}

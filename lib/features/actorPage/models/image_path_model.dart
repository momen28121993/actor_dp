import 'package:dp_move/features/actorPage/models/profile_model.dart';
import 'package:equatable/equatable.dart';

class ImagesPathList extends Equatable{

  List<Profiles>? _profiles;

  ImagesPath({ List<Profiles>? profiles}) {

    if (profiles != null) {
      this._profiles = profiles;
    }
  }

  List<Profiles>? get profiles => _profiles;
  set profiles(List<Profiles>? profiles) => _profiles = profiles;

  ImagesPathList.fromJson(Map<String, dynamic> json) {

    if (json['profiles'] != null) {
      _profiles = <Profiles>[];
      json['profiles'].forEach((v) {
        _profiles!.add(new Profiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._profiles != null) {
      data['profiles'] = this._profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw [profiles];
}



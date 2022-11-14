import 'package:equatable/equatable.dart';

class ActorModel extends Equatable{
  String? _biography;
  int? _gender;
  int? _id;
  String? _name;
  String? _profilePath;

  ActorModel({
    String? biography,
      int? gender,
      int? id,
      String? name,
      String? profilePath}) {
    if (biography != null) {
      this._biography = biography;
    }

    if (gender != null) {
      this._gender = gender;
    }
    if (id != null) {
      this._id = id;
    }else{this._id=0;}
    if (name != null) {
      this._name = name;
    }
    if (profilePath != null) {
      this._profilePath = profilePath;
    }else{this._profilePath = 'no';}
  }

  String? get biography => _biography;
  set biography(String? biography) => _biography = biography;
  int? get gender => _gender;
  set gender(int? gender) => _gender = gender;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get profilePath => _profilePath;
  set profilePath(String? profilePath) => _profilePath = profilePath;

  ActorModel.fromJson(Map<String, dynamic> json) {
    _biography = json['biography'];
    _gender = json['gender'];
    _id = json['id'];
    _name = json['name'];
    _profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['biography'] = this._biography;
    data['gender'] = this._gender;
    data['id'] = this._id;
    data['name'] = this._name;
    data['profile_path'] = this._profilePath;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [biography,gender,id,name,profilePath];
}

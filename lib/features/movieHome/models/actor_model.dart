class ActorModel {
late final bool adult;
late final int gender;
late final int id;
late final String knownForDepartment;
late final String name;
late final  double popularity;
late final String profilePath;

  ActorModel({
        required this.adult,
      required  this.gender,
      required  this.id,
      required  this.knownForDepartment,
       required this.name,
       required this.popularity,
      required  this.profilePath
  });

  ActorModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }


  }

class BiographyModel {

 late final String? biography;

  BiographyModel({
       required this.biography,
       });

  BiographyModel.fromJson(Map<String, dynamic> json) {

    biography = json['biography'];
  }
}

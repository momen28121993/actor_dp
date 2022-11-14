//type of data used to get the url of chosen actor images paths wich used to complete the url base to get photos
import 'package:equatable/equatable.dart';

class Profiles extends Equatable{
  String? _filePath;
  Profiles({
    String? filePath,
  }) {
    if (filePath != null) {
      this._filePath = filePath;
    }
  }

  String? get filePath => _filePath;
  set filePath(String? filePath) => _filePath = filePath;

  Profiles.fromJson(Map<String, dynamic> json) {
    _filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_path'] = this._filePath;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [filePath];
}

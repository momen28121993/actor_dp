

class UrlData {

  String actorUrl(String actorId) {
    return 'https://api.themoviedb.org/3/person/$actorId?api_key=$apiKey&language=en-US';
  }

  String urlBase(personId) {
    return 'https://api.themoviedb.org/3/person/$personId/images?api_key=$apiKey';
  }

  static const String baseUrlForNetImage = 'http://image.tmdb.org/t/p/original';

  static const String apiKey = "ddfc3b78adda5d8d71f3a0ddab4c3581";
}
// https://api.themoviedb.org/3/person/81?api_key=ddfc3b78adda5d8d71f3a0ddab4c3581&language=en-US

// https://api.themoviedb.org/3/person/20/images?api_key=ddfc3b78adda5d8d71f3a0ddab4c3581 final example}


//   http://image.tmdb.org/t/p/original


class UrlData {

// Common path

  String actorUrl(String pageNum) {return 'https://api.themoviedb.org/3/person/popular?api_key=$apiKey&language=en-US&page=$pageNum';}
  static const String apiKey = "ddfc3b78adda5d8d71f3a0ddab4c3581";

  //actor page feature
  String urlBase(personId) {return 'https://api.themoviedb.org/3/person/$personId/images?api_key=$apiKey';}


  static const String baseUrlForNetImage = 'http://image.tmdb.org/t/p/original';


 String aboutActorUrl (String actorId){
   return 'https://api.themoviedb.org/3/person/$actorId?api_key=$apiKey&language=en-US';
 }

}


//  https://api.themoviedb.org/3/person/200?api_key= ddfc3b78adda5d8d71f3a0ddab4c3581

//http://image.tmdb.org/t/p/original/yFc0xjezBzC8xTmC1fw8wy1pRrC.jpg"
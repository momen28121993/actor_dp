import 'package:flutter/cupertino.dart';

import 'features/movieHome/view/screens/movie_home_screen.dart';
import 'features/actorPage/view/screens/actor_screen.dart';

Map<String,Widget Function(BuildContext)> routes = {
     MovieHome.routName : (context) =>  const MovieHome() ,
     ActorScreen.routName : (context) => const ActorScreen(actorListIndex: null,),
   };

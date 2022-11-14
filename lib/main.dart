import 'package:dp_move/features/actorPage/view/screens/actor_screen.dart';
import 'package:dp_move/features/movieHome/view/screens/movie_home_screen.dart';
import 'package:dp_move/features/movieHome/viewModel/actor_provider.dart';
import 'package:dp_move/features/actorPage/modelView/images_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagePathProvider>(create: (context) => ImagePathProvider(),),
        ChangeNotifierProvider<ActorProvider>(create: (context) => ActorProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:MovieHome.id ,
        routes: {
          MovieHome.id : (context) =>  const MovieHome() ,
          ActorScreen.id : (context) => const ActorScreen(actorListIndex: null,),

          }
        ,
      ),
    );
  }}


// key   ddfc3b78adda5d8d71f3a0ddab4c3581


//http://image.tmdb.org/t/p/w300/$filePath

//  http://image.tmdb.org/t/p/original/vfPQnrMZ87uPjyJYrSkQtqI6c0H.jpg"
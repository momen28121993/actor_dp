
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'app_routs.dart';
import 'features/movieHome/view/screens/movie_home_screen.dart';
import 'features/actorPage/modelView/biography_provider.dart';
import 'features/actorPage/modelView/images_provider.dart';
import 'features/movieHome/viewModel/actor_provider.dart';

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
        ChangeNotifierProvider<ActorProvider>(create: (context) => ActorProvider(),),
        ChangeNotifierProvider<BiographyProvider>(create: (context) => BiographyProvider(),)

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:MovieHome.routName ,
        routes: routes ,

      ),
    );
  }}



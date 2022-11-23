
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../movieHome/viewModel/actor_provider.dart';
import '../../../../common/dimentions.dart';
import '../screens/biography_screen.dart';

class ActorInfoRow extends StatelessWidget {
  const ActorInfoRow({
    Key? key,
    required this.actorListIndex,required this.actorId,
  }) : super(key: key);

  final int? actorListIndex;
  final int? actorId;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:
            const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
            width: AppDimentions.mediaWidth(context) / 3,
            height: AppDimentions.mediaHieght(context)/4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(50)),
              image: DecorationImage(
                image: Provider.of<ActorProvider>(context).imageActor(actorListIndex!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  BiographyScreen (
                   actorIndex: actorListIndex ,
                   actorId: actorId,
                  ),
                ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Read about',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Text(Provider.of<ActorProvider>(context).actorsList[actorListIndex!].name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}
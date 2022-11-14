
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/dimentions.dart';
import '../../../movieHome/viewModel/actor_provider.dart';

class ActorInfoRow extends StatelessWidget {
  const ActorInfoRow({
    Key? key,
    required this.actorListIndex,
  }) : super(key: key);

  final int? actorListIndex;

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
            child: Card(
              color: Colors.teal,
              elevation: 5,
              child: SizedBox(
                height: AppDimentions.mediaHieght(context)/4,
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  interactive: true,
                  thickness: 5,
                  child: SingleChildScrollView(
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.vertical,
                      dragStartBehavior:  DragStartBehavior.start ,
                      child: Text('${Provider.of<ActorProvider>(context).actorsList[actorListIndex!].biography}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.visible,

                        ),
                      )),
                ),
              ),
            ),
          )
        ]);
  }
}
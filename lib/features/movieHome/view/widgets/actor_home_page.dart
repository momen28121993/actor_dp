import 'package:dp_move/common/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/colors.dart';
import '../../../../common/dimentions.dart';
import '../../../../common/widgets/text_widget.dart';
import '../../../actorPage/view/screens/actor_screen.dart';
import '../../viewModel/actor_provider.dart';

class ActorsHomePage extends StatelessWidget {
  const ActorsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActorProvider>(
      builder: (context, actorProv, child) {
        return SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: ListView.builder(
              itemCount: actorProv.actorsList.length + 1,
              itemBuilder: (context, index) {
                if (index < actorProv.actorsList.length) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActorScreen(
                            actorListIndex: index,
                            actorId: actorProv.actorsList[index].id,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: AppDimentions.mediaHieght(context) / 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Container(
                          color: AppColors.transparentColor.withOpacity(.4),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 10),
                                  width: AppDimentions.mediaWidth(context) / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    image: DecorationImage(
                                      image: actorProv.imageActor(index),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: HelperWidget.actorName(
                                      name:  actorProv.actorsList[index].name,
                                      color:  Colors.amber,
                                       fontFamily: 'DancingScript',
                                     wieght: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                } else {
                  Provider.of<ActorProvider>(context,listen: false)
                      .addMoreActors();
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: WaitingWidget(),
                  );
                }
              }),
        );
      },
    );
  }
}

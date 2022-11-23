import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../common/widgets/waiting_widget.dart';
import '../../viewModel/actor_provider.dart';
import '../../../../common/colors.dart';
import 'actor_home_page.dart';
import '/common/texts.dart';

class HomeFutureList extends StatelessWidget {
  const HomeFutureList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{  Provider.of<ActorProvider>(context, listen: false)
          .getActorData();},
      child: FutureBuilder(
          initialData: Provider.of<ActorProvider>(context, listen: false)
              .connectionCheck(),
          builder: (context, oneSnapshot) {
            if (oneSnapshot.connectionState == ConnectionState.waiting) {
              return const WaitingWidget();
            } else if (oneSnapshot.connectionState == ConnectionState.done &&
                Provider.of<ActorProvider>(context).connect == false) {
              return Center(
                child: Text(
                  AppTexts.connectionError,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    backgroundColor: AppColors.transparentColor.withOpacity(.5),
                  ),
                ),
              );
            } else {
              return FutureBuilder(
                  future: Provider.of<ActorProvider>(context, listen: false)
                      .getActorData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const WaitingWidget();
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return const ActorsHomePage();
                    } else {
                      return const Center(
                        child: Text(AppTexts.unexpectedError),
                      );
                    }
                  });
            }
          }),
    );
  }
}

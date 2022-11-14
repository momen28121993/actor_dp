import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/text_widget.dart';
import '../../../../common/widgets/waiting_widget.dart';
import '../../modelView/images_provider.dart';
import '../screens/image_full_screen.dart';

class ImageGallaryGrid extends StatelessWidget {
  const ImageGallaryGrid({
    Key? key,
    required this.actorId,
  }) : super(key: key);

  final int? actorId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
            future: Provider.of<ImagePathProvider>(context,listen: false).getFilePath(actorId!),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return const WaitingWidget();
              }
              else if(snapshot.connectionState==ConnectionState.done){
                return  GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: Provider.of<ImagePathProvider>(context).pathsList.length,
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  ImageFullScreen (
                              imageIndex : index,
                            ),
                          ),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          color: Colors.white,
                          child: Provider.of<ImagePathProvider>(context).getPhotos(index),
                        ),
                      ) ,
                );
              }else{
                return Center(
                  child: noPhotoText(
                      'UnExpected Error',
                      Colors.red,
                      FontWeight.bold
                  ),
                );
              }
            }
        )
    );
  }
}

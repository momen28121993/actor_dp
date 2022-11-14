import 'package:dp_move/features/actorPage/modelView/images_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/dowemload_button.dart';

class ImageFullScreen extends StatelessWidget {
  final int imageIndex;

  const ImageFullScreen({Key? key, required this.imageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Dowenload'),
        leading: DowenloadButton(imageIndex: imageIndex),
      ),
      body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(10),
            minScale: .5,
            maxScale: 4,
            child:
                Provider.of<ImagePathProvider>(context).getPhotos(imageIndex),
          )),
    );
  }
}



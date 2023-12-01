import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:flutter/material.dart';

class NetworkPickerImageBody extends StatelessWidget {
  NetworkPickerImageBody({super.key});
  final ImageRepository _imageRepo = ImageRepository();

// NOTE: THE API FOR THE IMAGES NO LONGER EXISTS SO DO NOT USE THE PLUS BUTTON
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixelfordImage>>(
      future: _imageRepo.getNetworkImages(),
      builder:
          (BuildContext context, AsyncSnapshot<List<PixelfordImage>> snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Image.network(snapshot.data![index].urlSmallSize);
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

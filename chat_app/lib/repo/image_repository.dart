import 'dart:convert';

import 'package:chat_app/models/image_model.dart';

class ImageRepository {
  get http => null;

  Future<List<PixelfordImage>> getNetworkImages() async {
    var endpointUrl = Uri.parse('https://pixelford.com/api2/images');

    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      final List<dynamic> decodedList =
          jsonDecode(response.body) as List; //body gives the actual JSON
      final List<PixelfordImage> _imageList = decodedList.map((listItem) {
        return PixelfordImage.fromJson(listItem);
      }).toList();
      print(_imageList[0].urlFullSize);
      return _imageList;
    } else {
      throw Exception("API not successful!");
    }
  }
}

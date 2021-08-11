import 'package:api_test/model/image_result.dart'as imageInfo;
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final imageInfo.ImageResult info;

  const ImageItem(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32),
        Image.network(
          info.previewURL ?? '',
          width: 200,
          height: 150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 32),
        Text(info.tags ?? ''),
      ],
    );
  }
}
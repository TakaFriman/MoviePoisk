import 'package:flutter/material.dart';

import '../images.dart';

class TopPosterWidget extends StatelessWidget {
  const TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(AppImages.topHeader)),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(
            image: AssetImage(
              AppImages.girlImg,
            ),
            width: 100,
            height: 100,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PeopleWidgets extends StatelessWidget {
  const PeopleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w800,
    );
    final jobTilteStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTilteStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTilteStyle),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTilteStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTilteStyle),
              ],
            )
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

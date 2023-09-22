import 'package:flutter/material.dart';


class IconContainer extends StatelessWidget {

  final String url;

  const IconContainer({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(url) ,
      ),
    );
  }
}
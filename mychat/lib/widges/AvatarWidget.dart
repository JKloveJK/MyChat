// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';

class Avatarwidget extends StatelessWidget {
  final String imageUrl;
  final double size;

  const Avatarwidget({
    Key? key,
    this.size = 40,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
  
}

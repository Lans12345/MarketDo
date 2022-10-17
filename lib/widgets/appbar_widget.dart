import 'package:flutter/material.dart';
import 'package:marketdo/widgets/text_widget.dart';

PreferredSizeWidget AppbarWidget(
  String title,
) {
  return AppBar(
    foregroundColor: Colors.white,
    backgroundColor: Colors.brown,
    title: TextRegular(text: title, fontSize: 18, color: Colors.white),
    centerTitle: true,
  );
}

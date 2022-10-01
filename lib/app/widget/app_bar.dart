import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

PreferredSize CustomAppBar({required title, actions}) {
  return PreferredSize(
      child: AppBar(
        backgroundColor: DSColors.secondaryDark,
        centerTitle: false,
        title: title,
        actions: actions,
      ),
      preferredSize: const Size.fromHeight(DSSizes.xl));
}

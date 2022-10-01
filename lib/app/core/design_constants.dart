import 'package:flutter/material.dart';

class DSColors {
  // accent colors
  static const Color secondary = Color(0xff005CAA);
  static const Color secondaryLight = Color(0xff328EDC);
  static const Color secondaryDark = Color(0xff003482);
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color(0xff003482),
      Color(0xff328EDC),
    ],
    tileMode: TileMode.repeated,
  );

  // default system colors
  static const Color error = Color(0xffff0000);
  static const Color alert = Color(0xfffaff00);
  static const Color success = Color(0xff25B900);

  // typography colors
  static const Color headingLight = Color(0xffffffff);
  static const Color headingDark = Color(0xff000000);
  static const Color bodyLight = Color(0xffffffff);
  static const Color bodyDark = Color(0xff000000);
  static const Color placeHolderLight = Color(0xffd2d2d2);
  static const Color placeHolderDark = Color(0xffb3b3b3);
  static const Color linkLight = Color(0xfff4f4f4);
  static const Color linkDark = Color(0xff000000);
  static const Color iconDark = Color(0xff6B6464);

  // element backgrounds
  static const Color backgroundBodyLight = Color(0xfff9f9f9);
  static const Color backgroundBodyDark = Color(0xffF4F4F4);
  static const Color backgroundBodyGrey = Color(0xffEFEDED);
  static const Color backgroundInputField = Color(0xfffbfbfb);
  static const LinearGradient backgroundBodyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xffEFEFEF),
      Color(0xffE2E2E2),
    ],
    tileMode: TileMode.repeated,
  );

  // border colors
  static const Color borderLight = Color(0xffe7e7e7);
  static const Color borderDark = Color(0xffc4c4c4);
}

class DSSizes {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 32;
  static const double xl = 64;
  static const double xxl = 128;
  static const double xxxl = 256;
  static const double xxxxl = 512;
}

class DSShadows {
  static const buttonCard = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6,
      offset: Offset(0, 2),
    )
  ];

  static const buttonCardHover = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 4,
      offset: Offset(0, 4),
    )
  ];

  static const navigationMenu = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 19,
      offset: Offset(0, 19),
    ),
    BoxShadow(
      color: Colors.black26,
      blurRadius: 6,
      offset: Offset(0, 8),
    )
  ];

  static const modal = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(7, 14),
    )
  ];

  static const bottomSheet = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(-2, 4),
    )
  ];
}

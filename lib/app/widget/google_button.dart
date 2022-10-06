import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key, this.onPressGoogle}) : super(key: key);

  final onPressGoogle;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: DSSizes.xxxl,
        height: DSSizes.xl,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              primary: DSColors.bodyLight,
              shadowColor: DSColors.bodyLight,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.google,
                  color: DSColors.secondaryDark,
                ),
                Text(
                  login,
                  style: const TextStyle(
                      letterSpacing: DSSizes.xxs,
                      color: DSColors.secondaryDark,
                      fontSize: DSSizes.md),
                )
              ],
            ),
            onPressed: () {
              onPressGoogle(context);
            }),
      );
}

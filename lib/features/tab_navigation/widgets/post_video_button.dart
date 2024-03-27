import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key, required this.isInverted});

  final bool isInverted;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            height: 30,
            width: 25,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: Color(0xff61d4f0),
              borderRadius: BorderRadius.circular(Sizes.size11),
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 30,
            width: 25,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size11),
            ),
          ),
        ),
        Container(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
          decoration: BoxDecoration(
            color: isInverted ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size11),
          ),
          child: Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: isInverted ? Colors.white : Colors.black,
                size: Sizes.size16,
              )),
        )
      ],
    );
  }
}

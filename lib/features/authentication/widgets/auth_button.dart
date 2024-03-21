import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/src/fa_icon.dart';
import 'package:tiktok/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.icon});

  final String text;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // 기본적으로 Box 위젯인데 크기를 픽셀로 하는게 아니라 부모의 크기에 비례해서 크기를 정함
      widthFactor: 1, // 부모의 크기에 비례해서 크기를 정함
      child: Container(
        padding: EdgeInsets.all(Sizes.size14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: Sizes.size2),
          borderRadius: BorderRadius.circular(Sizes.size5),
        ),
        child: Stack(
          // 차례대로 배치하는 게 아닌 그냥 그 위에 쌓음
          alignment: Alignment.center,
          children: [
            Align(
                // 위젯 하나만 조절 가능
                alignment: Alignment.centerLeft,
                child: icon),
            Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Sizes.size16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

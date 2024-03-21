import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/login_form_screen.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';

import '../../constants/gaps.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator
        .of(context).pop(context);

  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (context) => LoginFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // SafeArea : 뭔가에 가려지지 않음 상태바 같은 거
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size14),
          child: Column(
            children: [
              Gaps.v80,
              Text("Login in for TikTok",
                  style: TextStyle(
                      fontSize: Sizes.size24, fontWeight: FontWeight.w800)),
              Gaps.v20,
              Text(
                "Manage your account, check notifications, comment on videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                child: AuthButton(
                    icon : FaIcon(FontAwesomeIcons.user),
                    text: "Use Email & Password"),
                onTap: () => _onEmailLoginTap(context),
              ),
              Gaps.v16,
              AuthButton(
                  icon : FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Apple"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            Gaps.h5,
            GestureDetector(
                onTap: () => onSignUpTap(context),
                child: Text("Sign up",style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';
import 'package:tiktok/features/authentication/email_screen.dart';
import 'package:tiktok/features/authentication/username_screen.dart';

import '../../constants/gaps.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    void _onEmailTap(BuildContext context) {
      Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => EmailScreen()));
    }

    void _onUsernameTap(BuildContext context) {
      Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => UsernameScreen()));
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
              Text("Sign up for TikTok",
                  style: TextStyle(
                      fontSize: Sizes.size24, fontWeight: FontWeight.w800)),
              Gaps.v20,
              Text(
                "Create a profile, follow other accounts, make your own videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onUsernameTap(context),
                child: AuthButton(
                    icon : FaIcon(FontAwesomeIcons.user),
                    text: "Use Phone or Email"),
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
        color: Colors.grey.shade50,
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?"),
            Gaps.h5,
            GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text("Log In", style: TextStyle(color: Theme
                    .of(context)
                    .primaryColor, fontWeight: FontWeight.w600),)),
          ],
        ),
      ),
    );
  }
}

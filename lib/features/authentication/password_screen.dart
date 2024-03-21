import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/birthday_screen.dart';
import 'package:tiktok/features/authentication/password_screen.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';

import '../../constants/gaps.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String? _isPasswordValid() {
    final regExp = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{8,20}$");
    if (_password.length < 8 && _password.isNotEmpty) return null;
    if (!regExp.hasMatch(_password)) return null;

    return "";
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_password.isEmpty || _isPasswordValid() != null) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BirthdayScreen()));
  }

  void _onClearTap() {
    _passwordController.clear();
    setState(() {
      _obscureText = true;
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                "Password",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v8,
              TextField(
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                controller: _passwordController,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          )),
                      Gaps.h14,
                      GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ))
                    ],
                  ),
                  hintText: "Make it secure",
                  hintStyle: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.black45,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              Gaps.v10,
              Text(
                "Yout password must have:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.checkCircle,
                    color: _isPasswordValid() != null ? Colors.green : Colors.grey.shade400,
                    size: Sizes.size16,
                  ),
                  Gaps.h5,
                  Text(
                    "8-20 characters",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.checkCircle,
                    color: _isPasswordValid() != null ? Colors.green : Colors.grey.shade400,
                    size: Sizes.size16,
                  ),
                  Gaps.h5,
                  Text(
                    "Letters, numbers, and special characters",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                      disabled:
                          _password.isEmpty || _isPasswordValid() != null, text: "Next")),
            ],
          ),
        ),
      ),
    );
  }
}

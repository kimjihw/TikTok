import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  void _onDmPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
        actions: [
          IconButton(
              onPressed: _onDmPressed,
              icon: FaIcon(FontAwesomeIcons.paperPlane))
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){},
            title: Text(
              "Activity",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Sizes.size16),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            height: Sizes.size1,
          ),
          ListTile(
            leading: Container(
              width: Sizes.size48,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              child: Center(
                  child: FaIcon(FontAwesomeIcons.users,
                      color: Colors.white, size: Sizes.size20)),
            ),
            title: Text(
              "New Followers",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Sizes.size18),
            ),
            subtitle: Text(
              "See who followed you",
              style: TextStyle(
                  color: Colors.grey.shade600, fontSize: Sizes.size14),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

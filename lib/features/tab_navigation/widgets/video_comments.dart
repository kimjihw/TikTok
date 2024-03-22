import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Sizes.size16)),
      child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade50,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('22796 Comments'),
            actions: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.xmark),
                onPressed: _onClosePressed,
              ),
            ],
          ),
          body: ListView.separated(
            padding: EdgeInsets.symmetric(
                vertical: Sizes.size10, horizontal: Sizes.size16),
            itemCount: 10,
            separatorBuilder: (context, index) => Gaps.v20,
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 18,
                  child: Text("누구"),
                ),
                Gaps.h10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "nice",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade500),
                      ),
                      Gaps.v3,
                      Text(
                          "Thats not it i've seen the same thing but also in a cave")
                    ],
                  ),
                ),
                Gaps.h5,
                Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.heart,
                      size: Sizes.size20,
                      color: Colors.grey.shade500,
                    ),
                    Gaps.v2,
                    Text(
                      "1.6k",
                      style: TextStyle(color: Colors.grey.shade500),
                    )
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            surfaceTintColor: Colors.white,
            child: Row(
              children: [
                CircleAvatar(
                  radius:18,
                  child: Text("누구"),
                  backgroundColor: Colors.grey.shade500,
                  foregroundColor: Colors.white,
                ),
              ]
            )

          )),
    );
  }
}

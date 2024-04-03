import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/features/users/widgets/persistent_tab_bar.dart';

import '../../constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                centerTitle: true,
                title: Text("Profile"),
                actions: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: Sizes.size60,
                      foregroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                    ),
                    Text(
                      "ME",
                      style: TextStyle(fontSize: Sizes.size20),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Me",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h10,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue.shade500,
                        ),
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UserAccounts(account_text: "Followers", account: "97"),
                          VerticalDivider(
                            color: Colors.grey.shade300,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                            width: Sizes.size32,
                            thickness: 1,
                          ),
                          UserAccounts(account_text: "likes", account: "194.3M"),
                          VerticalDivider(
                            // 높이가 필요함
                            color: Colors.grey.shade300,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                            width: Sizes.size32,
                            thickness: 1,
                          ),
                          UserAccounts(
                              account_text: "Followings", account: "100"),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.80,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size12,),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    Sizes.size4,
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Follow",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Gaps.h4,
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    Sizes.size4,
                                  ),
                                ),
                              ),
                              child: Center(child: FaIcon(FontAwesomeIcons.youtube))
                            ),
                          ),
                          Gaps.h4,
                          Expanded(
                            flex: 1,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size12,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      Sizes.size4,
                                    ),
                                  ),
                                ),
                                child: Center(child: FaIcon(FontAwesomeIcons.caretDown))
                            ),
                          )
                        ],
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
                      child: Text(
                        "All highlights and where to watch live matches on FIFA I wonder do you know that?",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        RichText(
                          text: TextSpan(
                            text: "https://www.youtube.com",
                            style: TextStyle(
                              color: Colors.blue.shade500,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 100,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 14),
              itemBuilder: (context, index) => GridItem(index: index),
            ),
            Center(
              child: Text(
                "Tab 2",
                style: TextStyle(fontSize: Sizes.size52),
              ),
            )
          ],),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.index,
  });

  final index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 9 / 14,
          child: FadeInImage.assetNetwork(
            placeholder: "assets/images/intercontinental.png",
            image: "https://picsum.photos/200/300?random=$index",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Row(
              children: [
                Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                ),
                Text(
                  "4.${index}M",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            ))
      ],
    );
  }
}

class UserAccounts extends StatelessWidget {
  const UserAccounts({
    super.key,
    required this.account_text,
    required this.account,
  });

  final account_text;

  final account;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          account,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.size18),
        ),
        Gaps.v5,
        Text(
          account_text,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}

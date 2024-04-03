import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate{

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(top: Sizes.size10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
            horizontal: BorderSide(
                color: Colors.grey.shade200, width: 1)),
      ),
      child: const TabBar(
        indicatorColor: Colors.black,
        labelPadding: EdgeInsets.only(bottom: Sizes.size10),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.black,
        tabs: [
          Padding(
              padding:
              EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: Icon(Icons.grid_on)),
          Padding(
              padding:
              EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: FaIcon(FontAwesomeIcons.heart)),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent {
    return 47;
  }

  @override
  double get minExtent {
      return 47;
  }
}
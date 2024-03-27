import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

final tabs = ["Top", "Users", "Videos", "Sounds", "LIVE", "Shopping", "Brands"];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {

  final TextEditingController _searchController = TextEditingController(text: "Initial Value");


  void _onSearchChanged(String value) {
  }

  void _onSearchSubmitted(String value) {
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: CupertinoSearchTextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              splashFactory: NoSplash.splashFactory,
              unselectedLabelColor: Colors.grey.shade500,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              tabs: [for (var tab in tabs) Tab(text: tab)]),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(Sizes.size8),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 16),
              itemBuilder: (context, index) => Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.size4)),
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                    child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/intercontinental.png",
                        image: "https://picsum.photos/200/300?random=$index", fit: BoxFit.cover,)),
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: TextStyle(fontSize: Sizes.size52),
                ),
              )
          ],
        ),
      ),
    );
  }
}

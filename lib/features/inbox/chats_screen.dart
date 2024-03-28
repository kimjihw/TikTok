import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {

  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  List<int> _items =[];

  void _addItem(){
    if(_key.currentState != null) {
      _key.currentState!.insertItem(_items.length, duration: Duration(milliseconds: 500));
      _items.add(_items.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Direct Messages'),
        actions: [
          IconButton(onPressed: _addItem, icon: FaIcon(FontAwesomeIcons.plus))
        ],
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: 0,
        padding: EdgeInsets.symmetric(vertical: Sizes.size10),
        itemBuilder: (context, index, animation) {
          return  FadeTransition(
            opacity: animation,
            key: UniqueKey(),
            child: SizeTransition(
              sizeFactor: animation,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Text("A"),
                  foregroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Aman ($index)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("10:00 AM",
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: Sizes.size12)),
                  ],
                ),
                subtitle: Text(
                  "Hello, How are you?",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

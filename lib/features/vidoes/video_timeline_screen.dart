import 'package:flutter/material.dart';
import 'package:tiktok/features/vidoes/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];

  final PageController _pageController = PageController();

  final _scrollDuration = Duration(milliseconds: 250);

  final _scrollCurve = Curves.linear;

  int _itemCount = 4;

  void _onPageChanged(int page) {
    _pageController.animateToPage(page,
        duration: _scrollDuration, curve: _scrollCurve);
    if (page == _itemCount - 1) {
      _itemCount += 4;
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onVideoFinished() {
    return;
    // 아래거를 활성화 하면 다음 페이지로 이동
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }
  Future<void> _onRefresh(){
    return Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 50,
      edgeOffset: 10,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        controller: _pageController,
        itemCount: _itemCount,
        itemBuilder: (context, index) => VideoPost(onVideoFinished : _onVideoFinished, index : index),
      ),
    );
  }
}

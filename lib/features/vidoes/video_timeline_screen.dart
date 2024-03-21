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
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      controller: _pageController,
      itemCount: _itemCount,
      itemBuilder: (context, index) => VideoPost(onVideoFinished : _onVideoFinished),
    );
  }
}

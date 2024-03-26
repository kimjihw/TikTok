import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/features/tab_navigation/widgets/video_comments.dart';
import 'package:tiktok/features/vidoes/widgets/video_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../constants/sizes.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

// with -> 그 클래스를 다 복사해오는 것
// SingleTickerProviderStateMixin -> 화면이 보여질 때만 ticker 제공
class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");

  late final AnimationController _animationController;

  bool _isPaused = false;
  bool _isMoreTags = false;

  final Duration _animationDuration = Duration(milliseconds: 200);

  var tags = ["#지환", "#불장난", "#화재", "#경보", "#주의"];

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {});
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChange);
  }

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        widget.onVideoFinished();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    // vsync -> 위젯이 안 보일 때 애니메이션 작동 멈추는 것 처럼 불필요한 리소스 막기 위해 사용
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if(_videoPlayerController.value.isPlaying && info.visibleFraction == 0){
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _moreTags() {
    setState(() {
      _isMoreTags = !_isMoreTags;
    });
  }

  void _onCommentsTap(BuildContext context) async{
    if(_videoPlayerController.value.isPlaying){
      _onTogglePause();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
        context: context, builder: (context) => VideoComments());
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.index.toString()),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Container(color: Colors.black)),
          Positioned.fill(
              child: GestureDetector(
            onTap: _onTogglePause,
          )),
          Positioned.fill(
            child: IgnorePointer(
              // 포인터 이벤트를 무시하는 위젯
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController, // 컨트롤러 변화 감지
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child, // 여기에 있는 child 는 이 안에 AnimatedOpacity
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@지환",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold),
                ),
                Gaps.v10,
                Text(
                  "불장난",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v10,
                if (!_isMoreTags)
                  Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Text(
                          tags[i],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      GestureDetector(
                        onTap: _moreTags,
                        child: Text(
                          "... 더보기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      for (int i = 0; i < tags.length; i++)
                        Text(
                          tags[i],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      GestureDetector(
                        onTap: _moreTags,
                        child: Text(
                          " 접기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/57333984?v=4"),
                  ),
                  Gaps.v24,
                  GestureDetector(
                      child: VideoButton(
                          icon: FontAwesomeIcons.solidHeart, text: "2.9M")),
                  Gaps.v24,
                  GestureDetector(
                      onTap: () => _onCommentsTap(context),
                      child: VideoButton(
                          icon: FontAwesomeIcons.solidComment, text: "33M")),
                  Gaps.v24,
                  VideoButton(icon: FontAwesomeIcons.share, text: "share"),
                ],
              ))
        ],
      ),
    );
  }
}

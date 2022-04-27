import 'package:flutter/material.dart';
import 'package:projeto_final_unb/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class AssetPlayerWidget extends StatefulWidget {
  String? videoPath;
  AssetPlayerWidget({Key? key, this.videoPath}) : super(key: key);

  @override
  State<AssetPlayerWidget> createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath!);
    _controller.addListener(() => setState(() {}));
    _controller.setLooping(true);
    _controller.initialize().then((_) => _controller.play());
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _controller.value.volume == 0;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VideoPlayerWidget(controller: _controller),
          if (_controller != null && _controller.value.isInitialized)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: IconButton(
                  icon: Icon(
                    isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: () => _controller.setVolume(isMuted ? 1 : 0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

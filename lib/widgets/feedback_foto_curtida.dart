import 'package:flutter/material.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';
import 'package:projeto_final_unb/widgets/asset_player_widget.dart';

class FeedBackFotoCurtida extends StatefulWidget {
  AppSettings appSettings;
  FeedBackFotoCurtida({Key? key, required this.appSettings}) : super(key: key);

  @override
  State<FeedBackFotoCurtida> createState() => _FeedBackFotoCurtidaState();
}

class _FeedBackFotoCurtidaState extends State<FeedBackFotoCurtida> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("PARABÉNS!"),
      content: widget.appSettings.infoVideo['fileName'] != ""
          ? AssetPlayerWidget(
              videoPath:
                  "assets/videos/${widget.appSettings.infoVideo['fileName']}",
            )
          : const Text("VOCÊ ACERTOU!"),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              int tentativas = 0;
              Navigator.pop(context);
            },
            child: const Text("OK")),
      ],
    );
  }
}

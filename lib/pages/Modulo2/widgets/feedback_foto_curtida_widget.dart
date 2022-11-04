import 'package:flutter/material.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';
import 'package:projeto_final_unb/widgets/asset_player_widget.dart';
import 'package:provider/provider.dart';

class FeedBackFotoCurtida extends StatefulWidget {
  const FeedBackFotoCurtida({Key? key}) : super(key: key);

  @override
  State<FeedBackFotoCurtida> createState() => _FeedBackFotoCurtidaState();
}

class _FeedBackFotoCurtidaState extends State<FeedBackFotoCurtida> {
  @override
  Widget build(BuildContext context) {
    var appSettings = context.watch<AppSettings>();
    return AlertDialog(
      title: const Text("PARABÉNS!"),
      content: appSettings.infoVideo['fileName'] != ""
          ? AssetPlayerWidget(
              videoPath: "assets/videos/${appSettings.infoVideo['fileName']}",
            )
          : const Text("VOCÊ ACERTOU!"),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK")),
      ],
    );
  }
}

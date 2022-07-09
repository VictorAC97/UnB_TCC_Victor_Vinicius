import 'package:flutter/material.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';
import 'package:projeto_final_unb/widgets/asset_player_widget.dart';
import '../utilities/videos_list_names.dart';

class TelaConfiguracoes extends StatefulWidget {
  AppSettings appSettings;
  TelaConfiguracoes({
    Key? key,
    required this.appSettings,
  }) : super(key: key);

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var _infoVideo = widget.appSettings.infoVideo;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("CONFIGURAÇÕES"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "OPÇÕES DE VIDEO",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Column(
                children: video_list_names
                    .map(
                      (item) => RadioListTile(
                        title: Text(
                          item['titulo'].toString(),
                        ),
                        subtitle: Text(item['ator'].toString()),
                        value: item['fileName'].toString(),
                        groupValue: _infoVideo['fileName'].toString(),
                        activeColor: Colors.black,
                        onChanged: (item) {
                          widget.appSettings.setInfoVideo(item.toString());
                          setState(() {
                            _infoVideo['fileName'] = item;
                          });
                        },
                        secondary: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text("DEMONSTRAÇÃO"),
                                    Text(
                                      item['titulo'].toString(),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                content: item['fileName'] != ""
                                    ? AssetPlayerWidget(
                                        videoPath:
                                            "assets/videos/${item['fileName']}",
                                      )
                                    : const Text("VOCÊ ACERTOU!"),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Align(
                                        alignment: Alignment.center,
                                        child: Text("RETORNAR")),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ));
  }
}
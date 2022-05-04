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
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                widget.appSettings.setInfoVideo(_infoVideo['fileName']);
                Navigator.pop(context);
              }),
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
                          setState(() {
                            _infoVideo['fileName'] = item;
                            //widget.appSettings.setInfoVideo(item.toString());
                          });
                        },
                        secondary: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("DEMONSTRAÇÃO"),
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
                                    child: const Text("OK"),
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

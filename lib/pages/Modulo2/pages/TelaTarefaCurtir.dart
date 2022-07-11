import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/AcertosCurtidasNotifier.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaCurtirFoto.dart';
import '../../../utilities/pictureAndEmoji.dart';
import 'package:provider/provider.dart';

class TelaTarefaCurtir extends StatefulWidget {
  const TelaTarefaCurtir({Key? key}) : super(key: key);

  @override
  State<TelaTarefaCurtir> createState() => _TelaTarefaCurtirState();
}

late ScrollController _scrollController;

class _TelaTarefaCurtirState extends State<TelaTarefaCurtir> {
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "LIÇÃO INTERAGIR COM EMOJI",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 1),
              SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: fotoEemoji.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 6,
                        margin: const EdgeInsets.all(10),
                        color: Colors.grey[300],
                        child: ListTile(
                          title: const Text(
                            "FOTO",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("${fotoEemoji[index]["tarefa"]}"),
                          leading: Consumer<AcertosCurtidasNotifier>(
                            builder: (context, acertos, child) => CircleAvatar(
                              child: acertos.lista
                                      .contains(fotoEemoji[index]["foto"])
                                  ? const Icon(Icons.check)
                                  : Text(
                                      (index + 1).toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                              backgroundColor: acertos.lista
                                      .contains(fotoEemoji[index]["foto"])
                                  ? const Color.fromARGB(255, 206, 206, 206)
                                  : Colors.white,
                              foregroundColor: Colors.black,
                              radius: 25,
                            ),
                          ),
                          trailing: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaCurtirFoto(
                                            index: index,
                                          )));
                            },
                            icon: const Icon(Icons.thumb_up),
                            label: const Text("Curtir"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

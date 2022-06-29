import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/AcertosCurtidasNotifier.dart';
import 'package:projeto_final_unb/pages/TelaCurtirFoto.dart';
import '../utilities/pictureAndEmoji.dart';
import 'package:provider/provider.dart';

class TelaTarefaCurtir extends StatefulWidget {
  const TelaTarefaCurtir({Key? key}) : super(key: key);

  @override
  State<TelaTarefaCurtir> createState() => _TelaTarefaCurtirState();
}

class _TelaTarefaCurtirState extends State<TelaTarefaCurtir> {
  @override
  Widget build(BuildContext context) {
    var acertosList = context.watch<AcertosCurtidasNotifier>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onLongPress: () {
                  acertosList.limparAcertos();
                },
                child: const Text(
                  "LIÇÃO INTERAGIR COM EMOJI",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(thickness: 1),
              SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: ListView.builder(
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
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            radius: 25,
                          ),
                        ),
                        trailing: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CurtirFoto(
                                          image: fotoEemoji[index]["foto"],
                                          emoji: fotoEemoji[index]["emoji"],
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
            ],
          ),
        ),
      ),
    );
  }
}

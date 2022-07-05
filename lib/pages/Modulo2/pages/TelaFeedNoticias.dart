import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:provider/provider.dart';

class TelaFeedNoticias extends StatelessWidget {
  const TelaFeedNoticias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Feed de Noticias'),
      ),
      body: Consumer<CompartilhamentosNotifier>(
          builder: ((context, value, child) {
        return ListView.builder(
            itemCount: value.lista.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                        "assets/images/imagensCurtir/${value.lista[index]['foto']}"),
                    title: Text(value.lista[index]['comentario']!),
                    trailing: Text('${value.lista[index]['data']}'),
                  ),
                ));
      })),
    );
  }
}

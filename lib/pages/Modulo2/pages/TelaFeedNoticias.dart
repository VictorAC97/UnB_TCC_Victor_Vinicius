import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/feed_post_card_widget.dart';
import 'package:provider/provider.dart';

class TelaFeedNoticias extends StatefulWidget {
  final Usuario user;
  const TelaFeedNoticias({Key? key, required this.user}) : super(key: key);

  @override
  State<TelaFeedNoticias> createState() => _TelaFeedNoticiasState();
}

class _TelaFeedNoticiasState extends State<TelaFeedNoticias> {
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Feed de Noticias'),
      ),
      body: Consumer<CompartilhamentosNotifier>(
        builder: ((context, value, child) {
          return Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: value.lista.length,
                itemBuilder: (context, index) {
                  int reverseIndex = value.lista.length - 1 - index;
                  return FeedPostCardWidget(
                    post: value.lista[reverseIndex],
                    user: widget.user,
                  );
                }),
          );
        }),
      ),
    );
  }
}

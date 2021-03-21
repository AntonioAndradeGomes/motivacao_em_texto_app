import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';
import 'package:motivacao_em_texto/models/Mensagem.dart';
part 'mensagem_store.g.dart';

class MensagemStore = _MensagemStoreBase with _$MensagemStore;

abstract class _MensagemStoreBase with Store {
  var randon = Random();

  @observable
  Mensagem mensagem;

  @action
  Future<void> buscarMensagem() async {
    mensagem = null;
    await Future.delayed(const Duration(
      seconds: 2,
    ));
    int ran = randon.nextInt(mensagens.length);
    print('Randon : $ran');
    mensagem = mensagens[ran];
  }

  @computed
  Color get cor => mensagem == null
      ? Colors.pink[300]
      : Color(
          int.parse(mensagem.cor.substring(1, mensagem.cor.length), radix: 16) +
              0xFF000000);

  final List<Mensagem> mensagens = [
    Mensagem(
      id: 1,
      texto: 'A persistência é o caminho do êxito.',
      autor: 'Charles Chaplin',
      cor: '#008B8B',
    ),
    Mensagem(
      id: 2,
      texto: 'Só existe um êxito: a capacidade de levar a vida que se quer.',
      autor: 'Cristopher Morley',
      cor: '#FF6347',
    ),
    Mensagem(
      id: 3,
      texto:
          'A coragem não é ausência do medo; é a persistência apesar do medo.',
      autor: 'Autor Desconhecido',
      cor: '#BC8F8F',
    ),
    Mensagem(
      id: 4,
      texto:
          'Só se pode alcançar um grande êxito quando nos mantemos fiéis a nós mesmos.',
      autor: 'Friedrich Nietzsche',
      cor: '#32CD32',
    ),
  ];
}

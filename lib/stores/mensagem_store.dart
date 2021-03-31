import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:motivacao_em_texto/models/Mensagem.dart';
import 'package:motivacao_em_texto/services/mensagens_reporsitory.dart';
part 'mensagem_store.g.dart';

class MensagemStore = _MensagemStoreBase with _$MensagemStore;

abstract class _MensagemStoreBase with Store {
  @observable
  Mensagem mensagem;

  ObservableList<String> listaId = ObservableList<String>();

  @action
  Future<void> buscarMensagem() async {
    mensagem = null;
    try {
      Mensagem mensagemGet = await MensagemRepositorio().getMensage(
        lista: listaId,
      );
      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );
      mensagem = mensagemGet;

      if (listaId.length < 3) {
        listaId.add(mensagemGet.id);
      } else {
        listaId.removeAt(0);
        listaId.add(mensagemGet.id);
      }
      print(listaId);
    } catch (e) {
      print(e);
      print('erro');
    }
  }

  @computed
  Color get cor => mensagem == null
      ? Colors.pink[300]
      : Color(int.parse(
              mensagem.cor.substring(
                1,
                mensagem.cor.length,
              ),
              radix: 16) +
          0xFF000000);

  /*final List<Mensagem> mensagens = [
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
  ];*/
}

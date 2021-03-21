import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:motivacao_em_texto/stores/mensagem_store.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  MensagemStore _store = MensagemStore();
  @override
  Widget build(BuildContext context) {
    if (_store.mensagem == null) {
      _store.buscarMensagem();
    }
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: _store.cor,
          title: const Text(
            'Motivação em texto',
            style: TextStyle(
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: _store.cor,
        body: _store.mensagem == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SpinKitThreeBounce(
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "\"${_store.mensagem.texto}\" - ${_store.mensagem.autor}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'DancingScript',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(
                              onPressed: () => _store.buscarMensagem(),
                              elevation: 0,
                              focusElevation: 0,
                              mini: true,
                              hoverElevation: 0,
                              highlightElevation: 0,
                              splashColor: _store.cor,
                              tooltip: 'Próxima mensagem',
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.navigate_next,
                                color: _store.cor,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

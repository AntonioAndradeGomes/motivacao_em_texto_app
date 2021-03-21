// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensagem_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MensagemStore on _MensagemStoreBase, Store {
  Computed<Color> _$corComputed;

  @override
  Color get cor => (_$corComputed ??=
          Computed<Color>(() => super.cor, name: '_MensagemStoreBase.cor'))
      .value;

  final _$mensagemAtom = Atom(name: '_MensagemStoreBase.mensagem');

  @override
  Mensagem get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(Mensagem value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  final _$buscarMensagemAsyncAction =
      AsyncAction('_MensagemStoreBase.buscarMensagem');

  @override
  Future<void> buscarMensagem() {
    return _$buscarMensagemAsyncAction.run(() => super.buscarMensagem());
  }

  @override
  String toString() {
    return '''
mensagem: ${mensagem},
cor: ${cor}
    ''';
  }
}

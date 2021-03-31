import 'package:dio/dio.dart';
import 'package:motivacao_em_texto/const.dart';
import 'package:motivacao_em_texto/models/Mensagem.dart';

class MensagemRepositorio {
  Dio _dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: 20000,
  ));
  Future<Mensagem> getMensage({List<String> lista}) async {
    try {
      //print('Lista: ${lista}');
      if (lista == null) {
        Response response = await _dio.get('/messages');
        print(response.data);
        return Mensagem.fromJson(response.data);
      } else if (lista.length == 0) {
        Response response = await _dio.get('/messages');
        print(response.data);
        return Mensagem.fromJson(response.data);
      } else if (lista.length == 1) {
        Response response = await _dio.get('/messages/${lista[0]}');
        print(response.data);
        return Mensagem.fromJson(response.data);
      } else if (lista.length == 2) {
        Response response = await _dio.get('/messages/${lista[0]}/${lista[1]}');
        print(response.data);
        return Mensagem.fromJson(response.data);
      } else {
        Response response =
            await _dio.get('/messages/${lista[0]}/${lista[1]}/${lista[2]}');
        print(response.data);
        return Mensagem.fromJson(response.data);
      }
    } catch (e) {
      print(e);
      throw 'Erro';
    }
  }
}

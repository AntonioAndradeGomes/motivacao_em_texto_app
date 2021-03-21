class Mensagem {
  int id;
  String texto, autor, cor;

  Mensagem({
    this.id,
    this.texto,
    this.autor,
    this.cor,
  });

  factory Mensagem.fromJson(Map<String, dynamic> data) => Mensagem(
        id: data['id'],
        texto: data['texto'],
        autor: data['autor'],
        cor: data['cor'],
      );

  Map<String, dynamic> toJson() => {
        'texto': texto,
        'autor': autor,
        'cor': cor,
      };
}

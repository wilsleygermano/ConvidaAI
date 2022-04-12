class Evento {
  String titulo;
  String url;
  String data;
  String local;
  String valor;
  String pix;

  Evento(this.titulo, this.url, this.data, this.local, this.valor, this.pix);

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'url': url,
      'data': data,
      'local': local,
      'valor': valor,
      'pix': pix
    };
  }

  static Evento fromJson(Map<String, dynamic> json) {
    return Evento(json['titulo'], json['url'], json['data'], json['local'],
        json['valor'], json['pix']);
  }
}

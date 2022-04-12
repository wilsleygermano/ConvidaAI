class Evento {
  String titulo;
  String? url;
  String data;
  String local;
  String? valor;
  String? pix;
  String uID;

  Evento(this.titulo, this.url, this.data, this.local, this.valor, this.pix, this.uID);

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'url': url,
      'data': data,
      'local': local,
      'valor': valor,
      'pix': pix,
      'user_uid': uID
    };
  }

  static Evento fromJson(Map<String, dynamic> json) {
    return Evento(json['titulo'], json['url'], json['data'], json['local'],
        json['valor'], json['pix'], json['user_uid']);
  }
}

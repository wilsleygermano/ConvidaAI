class Evento {
  String titulo;
  String? url;
  String data;
  String local;
  String? valor;
  String? pix;
  String uID;

  Evento(
      {required this.titulo,
      this.url,
      required this.data,
      required this.local,
      this.valor = "0",
      this.pix = "N/A",
      required this.uID});

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
    return Evento(
        titulo: json['titulo'],
        url: json['url'],
        data: json['data'],
        local: json['local'],
        valor: json['valor'],
        pix: json['pix'],
        uID: json['user_uid']);
  }
}

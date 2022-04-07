class Usuario {
  String email;
  String senha;
  String pix;

  Usuario(this.email, this.senha, this.pix);
  Map<String, dynamic> toJson() {
    return {'email': email, 'senha': senha, 'pix': pix};
  }

  Usuario fromJson(Map<String, dynamic> json) {
    return Usuario(json['email'], json['senha'], json['pix']);
  }
}

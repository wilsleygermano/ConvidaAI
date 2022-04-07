class Usuario {
  String email;
  String pix;

  Usuario(this.email, this.pix);
  Map<String, dynamic> toJson() {
    return {'email': email, 'pix': pix};
  }

  Usuario fromJson(Map<String, dynamic> json) {
    return Usuario(json['email'], json['pix']);
  }
}

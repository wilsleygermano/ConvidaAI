class Usuario {
  String uid;
  String pix;

  Usuario(this.uid, this.pix);
  Map<String, dynamic> toJson() {
    return {'uid': uid, 'pix': pix};
  }

  Usuario fromJson(Map<String, dynamic> json) {
    return Usuario(json['uid'], json['pix']);
  }
}

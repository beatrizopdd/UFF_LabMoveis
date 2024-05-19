class Comentario {
  int indice;
  int postRelacionado;
  String email;
  String titulo;
  String corpo;

  Comentario(this.indice, this.postRelacionado, this.email, this.titulo, this.corpo);

  factory Comentario.conversor(arquivo) {
    return Comentario(
      arquivo["id"],
      arquivo["postId"],
      arquivo["email"],
      arquivo["name"],
      arquivo["body"],
    );
  }
}
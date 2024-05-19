class Semana {
  int casosPrevistos;
  int casosNotificados;
  int nivel;
  double tempMin;
  double tempMax;

  Semana(this.casosPrevistos, this.casosNotificados, this.nivel, this.tempMin, this.tempMax);

  factory Semana.conversor(arquivo) {
    return Semana(
      arquivo["casos_est"],
      arquivo["casos"],
      arquivo["nivel"],
      arquivo["tempmin"],
      arquivo["tempmax"],
    );
  }
}
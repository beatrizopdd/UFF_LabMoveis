class Semana {
  var casosEstimados;
  var casosNotificados;
  var nivel;
  var tempMin;
  var tempMax;

  Semana(this.casosEstimados, this.casosNotificados, this.nivel, this.tempMin, this.tempMax);

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
void main() {
  double salario = 2850;
  double parcelaMax = (salario * 0.3);
  double parcelaJuros = (parcelaMax * 1.12);
  print("Seu salário é $salario, Sua Parcela é ${parcelaMax.toStringAsFixed(2)}, com Juros fica ${parcelaJuros.toStringAsFixed(2)}");
}
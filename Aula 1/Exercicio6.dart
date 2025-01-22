  class Conta{
    double saldo = 0;
    double saque = 0;
}
void main() {
  Conta conta = Conta(); //Intaciando a Classe conta em conta.
  conta.saque = 400;
  print("O valor do saque foi de R\$ ${conta.saque.toStringAsFixed(2)}");
}